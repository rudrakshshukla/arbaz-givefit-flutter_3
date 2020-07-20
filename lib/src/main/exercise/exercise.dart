import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:givefit/src/main/exercise/equipment_model.dart';
import 'package:givefit/src/main/exercise/exercise_model.dart';
import 'package:givefit/utils/color_utils.dart';
import 'package:givefit/utils/constants.dart';
import 'package:givefit/utils/navigation.dart';
import 'package:givefit/widgets/custom_background.dart';

class ExerciseScreen extends StatefulWidget {
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final exerciseList = _exerciseList();
  final equipmentList = _equipmentList();

  var _duration = 0.0;

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/ic_login.webp',
            width: 70,
            height: 70,
          ),
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.all(20.0),
            icon: Image.asset('assets/images/ic_menu.png'),
            onPressed: () {
              NavigationUtils.push(context, routeMenu);
            },
          )
        ],
//        leading: GestureDetector(
//          onTap: (){
//            NavigationUtils.push(context, routeMenu);
//          },
//          child: Image.asset(
//            'assets/images/ic_menu.png',
//          ),
//        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      color: addNoteColor,
                      height: 50,
                      padding: EdgeInsets.all(10.0),
                      child: Image.asset('assets/images/ic_male.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(

                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Container(
                      height: 50,
                      color: addNoteColor,
                      padding: EdgeInsets.all(10.0),
                      child: Image.asset('assets/images/ic_male_female.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      color: addNoteColor,
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/ic_female.png'),
                    ),
                  ),
                ),
              ],
            ),
            GridView.count(
              physics: new NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              childAspectRatio: 1.9,
              padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
              children: List.generate(exerciseList.length, (index) {
                return Container(
                  color: addNoteColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(8),
                        decoration: new BoxDecoration(
                          color: redColor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          exerciseList[index].icon,
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Text(
                        exerciseList[index].title,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Duration',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                  Container(
                    color: addNoteColor,
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      '${_duration.toInt()} Min',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
            Slider(
              value: _duration,
              min: 0,
              max: 60,
              activeColor: redColor,
              onChanged: (value) {
                setState(() {
                  _duration = value;
                });
              },
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                child: Text(
                  'Select Equipment',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showAddEquipment();
              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Equipment',
                      style: TextStyle(fontSize: 16),
                    ),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: redColor,
                padding: EdgeInsets.all(10.0),
                onPressed: () {
                  NavigationUtils.push(context, routeHome);
                },
                child: Text(
                  'SEARCH',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showAddEquipment() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: double.maxFinite,
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: const Color(0xFFFFFF),
              borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Select Equipment',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.6,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: equipmentList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CheckboxListTile(
                        title: Text(equipmentList[index].title),
                        value: equipmentList[index].isSelected,
                        onChanged: (bool value) {
                          setState(() {
                            equipmentList[index].isSelected =
                                !equipmentList[index].isSelected;
                          });
                          Navigator.pop(context);
                          showAddEquipment();
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.white,
                        padding: EdgeInsets.all(16.0),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'CANCEL',
                          style: TextStyle(color: redColor, fontSize: 16),
                        ),
                      ),
                      RaisedButton(
                        color: redColor,
                        padding: EdgeInsets.all(16.0),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'DONE',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

List<ExerciseModel> _exerciseList() {
  final exerciseList = List<ExerciseModel>();
  exerciseList.add(ExerciseModel("Core", "assets/images/ic_core.png"));
  exerciseList.add(ExerciseModel("Upper", "assets/images/ic_lover.png"));
  exerciseList.add(ExerciseModel("Full", "assets/images/ic_full.png"));
  exerciseList.add(ExerciseModel("Lower", "assets/images/ic_lower.png"));
  exerciseList.add(ExerciseModel("HIIT", "assets/images/ic_hiit.png"));
  exerciseList.add(ExerciseModel("Cardio", "assets/images/ic_cardio.png"));
  return exerciseList;
}

List<EquipmentModel> _equipmentList() {
  final equipmentList = List<EquipmentModel>();
  equipmentList.add(EquipmentModel("Treadmill", false));
  equipmentList.add(EquipmentModel("Ellipticals", false));
  equipmentList.add(EquipmentModel("Stationary Bikes", false));
  equipmentList.add(EquipmentModel("Aerobic steppers", false));
  equipmentList.add(EquipmentModel("Cable Pulley Machines", false));
  equipmentList.add(EquipmentModel("Weight machines", false));
  equipmentList.add(EquipmentModel("Free weights", false));
  equipmentList.add(EquipmentModel("Rowing Machines", false));
  equipmentList.add(EquipmentModel("Exercise Balls", false));
  equipmentList.add(EquipmentModel("Plyo Boxes", false));
  equipmentList.add(EquipmentModel("Calf machine", false));
  return equipmentList;
}
