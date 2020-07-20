import 'package:flutter/material.dart';
import 'package:givefit/src/main/workout/complete_workout_item.dart';
import 'package:givefit/utils/constants.dart';
import 'package:givefit/utils/navigation.dart';
import 'package:givefit/widgets/custom_background.dart';

class CompleteWorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Completed Workout',
            style: TextStyle(fontSize: 25, color: Colors.white),
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
        actions: <Widget>[
          IconButton(
              icon: Image.asset('assets/images/ic_search.png'),
              onPressed: () {
                NavigationUtils.push(context, routeSearch);
              })
        ],
      ),
      child: Column(
        children: <Widget>[
//          Container(
//            margin: EdgeInsets.only(top: 32),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                GestureDetector(
//                  onTap: () {
//                    NavigationUtils.pop(context);
//                  },
//                  child: Padding(
//                    padding: const EdgeInsets.all(32.0),
//                    child: Align(
//                      alignment: Alignment.topLeft,
//                      child: Container(
//                        child: Image.asset('assets/images/ic_back.png'),
//                      ),
//                    ),
//                  ),
//                ),
//                Container(
//                  child: Text(
//                    'Completed Workout',
//                    style: TextStyle(fontSize: 25, color: Colors.white),
//                  ),
//                ),
//                GestureDetector(
//                  onTap: () {
//                    NavigationUtils.pop(context);
//                  },
//                  child: Padding(
//                    padding: const EdgeInsets.only(left:32.0,right: 16.0),
//                    child: Align(
//                      alignment: Alignment.topRight,
//                      child: Container(
//                        child: Image.asset('assets/images/ic_search.png'),
//                      ),
//                    ),
//                  ),
//                )
//              ],
//            ),
//          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.81,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return CompleteWorkoutItem();
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
