import 'package:flutter/material.dart';
import 'package:givefit/utils/color_utils.dart';
import 'package:givefit/utils/constants.dart';
import 'package:givefit/utils/navigation.dart';
import 'package:givefit/widgets/custom_background.dart';

class EmptyNotesScreen extends StatelessWidget {
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
            'Notes',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        leading: Image.asset(
          'assets/images/ic_back.png',
        ),
      ),
      child: Column(
        children: <Widget>[
//          Stack(
//            children: <Widget>[
//              GestureDetector(
//                onTap: () {
//                  NavigationUtils.pop(context);
//                },
//                child: Align(
//                  alignment: Alignment.topLeft,
//                  child: Container(
//                    padding:
//                        EdgeInsets.only(top: 32.0, left: 32.0, right: 32.0),
//                    margin: EdgeInsets.only(top: 30),
//                    child: Image.asset('assets/images/ic_back.png'),
//                  ),
//                ),
//              ),
//              Align(
//                alignment: Alignment.center,
//                child: Container(
//                  padding: EdgeInsets.all(32.0),
//                  margin: EdgeInsets.only(top: 30),
//                  child: Text(
//                    'Notes',
//                    style: TextStyle(fontSize: 25, color: Colors.white),
//                  ),
//                ),
//              )
//            ],
//          ),
          Container(
            margin: EdgeInsets.only(
              top: 100,
            ),
            child: Image.asset('assets/images/ic_illustration.png'),
          ),
          Container(
            padding: EdgeInsets.all(32),
            child: Text(
              'No Notes!',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8.0,right: 8.0),
            child: Text(
              'In hac habitasse platea dictumst. Sed vulputate id ipsum vel mollis.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: grayColor),
            ),
          ),
          GestureDetector(
            onTap: (){
              NavigationUtils.push(context, routeAddNotes);
            },
            child: Container(
              width: 150,
              height: 50,
              margin: EdgeInsets.only(top: 40,bottom: 100),
              color: redColor,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Add Notes',
                  style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
