import 'package:flutter/material.dart';
import 'package:givefit/src/main/exercise/exercise_model.dart';
import 'package:givefit/utils/color_utils.dart';
import 'package:givefit/utils/navigation.dart';
import 'package:givefit/widgets/custom_background.dart';

class SearchScreen extends StatelessWidget {
  final exerciseList = _exerciseList();
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
        leading: GestureDetector(
          onTap: (){
            NavigationUtils.pop(context);
          },
          child: Image.asset(
            'assets/images/ic_back.png',
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(10.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                )
            ),

            GridView.count(
              physics: new NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              childAspectRatio: 1.1,
              padding: const EdgeInsets.all(10),
              children: List.generate(exerciseList.length, (index) {
                return Container(
                  color: addNoteColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.all(8),
                        decoration: new BoxDecoration(
                          color: addNoteColor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          exerciseList[index].icon,
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Text(
                        exerciseList[index].title,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

List<ExerciseModel> _exerciseList() {
  final exerciseList = List<ExerciseModel>();
  exerciseList.add(ExerciseModel("Core", "assets/images/ic_core.png"));
  exerciseList.add(ExerciseModel("Upper", "assets/images/ic_upper.png"));
  exerciseList.add(ExerciseModel("Full", "assets/images/ic_full.png"));
  exerciseList.add(ExerciseModel("Lower", "assets/images/ic_lover.png"));
  exerciseList.add(ExerciseModel("Hiit", "assets/images/ic_hiit.png"));
  exerciseList.add(ExerciseModel("Cardio", "assets/images/ic_cardio.png"));

  return exerciseList;
}
