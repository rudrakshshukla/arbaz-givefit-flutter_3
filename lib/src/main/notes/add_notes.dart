import 'package:flutter/material.dart';
import 'package:givefit/utils/color_utils.dart';
import 'package:givefit/utils/navigation.dart';
import 'package:givefit/widgets/custom_background.dart';

class AddNotesScreen extends StatelessWidget {
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
            'Add Notes',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            NavigationUtils.pop(context);
          },
          child: Image.asset(
            'assets/images/ic_back.png',
          ),
        ),
        actions: <Widget>[
          FlatButton(
              child: Text(
                'DONE',
                style: TextStyle(fontSize: 15, color: redColor),
              ),
              onPressed: () {
                NavigationUtils.pop(context);
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
//                    'Add Notes',
//                    style: TextStyle(fontSize: 25, color: Colors.white),
//                  ),
//                ),
//                FlatButton(
//                  onPressed: () {
//                    NavigationUtils.push(context, routeNotes);
//                  },
//                  child: Text(
//                    'Done',
//                    style: TextStyle(color: redColor),
//                  ),
//                ),
//              ],
//            ),
//          ),
          Container(
            margin: EdgeInsets.all(16.0),
            decoration: new BoxDecoration(
                color: addNoteColor,
                borderRadius: new BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                maxLines: 5,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
