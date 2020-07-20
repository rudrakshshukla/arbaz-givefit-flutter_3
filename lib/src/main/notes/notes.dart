import 'package:flutter/material.dart';
import 'package:givefit/src/main/comments/comment_item.dart';
import 'package:givefit/src/main/notes/notes_item.dart';
import 'package:givefit/utils/navigation.dart';
import 'package:givefit/widgets/custom_background.dart';

class NotesScreen extends StatelessWidget {
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
//                    EdgeInsets.only(top: 32.0, left: 32.0, right: 32.0),
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
            height: MediaQuery
                .of(context)
                .size
                .height * 0.8,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return NotesItem();
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
