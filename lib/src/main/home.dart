import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:givefit/apis/api_manager.dart';
import 'package:givefit/src/main/home_item.dart';
import 'package:givefit/src/main/model/video_model.dart';
import 'package:givefit/utils/color_utils.dart';
import 'package:givefit/utils/constants.dart';
import 'package:givefit/utils/navigation.dart';
import 'package:givefit/widgets/custom_background.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final videoList = _videoList();
    final controller = PageController(viewportFraction: 1 / 1.1);

    return CustomBackground(
      appBar: AppBar(
        backgroundColor: pageBackgroundColor,
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
          onTap: () {
            NavigationUtils.pushAndRemoveUntil(context, routeExercise);
          },
          child: Icon(
            Icons.home,
            color: Colors.white,
            size: 35,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Image.asset('assets/images/ic_menu.png'),
              onPressed: () {
                getFiltersList();
                NavigationUtils.push(context, routeMenu);
              })
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 250,
              color: pageBackgroundColor,
              child: PageView.builder(
                controller: controller,
                itemBuilder: (context, position) {
                  final videoId = YoutubePlayer.convertUrlToId(
                      videoList[position].videoUrl);
                  return Stack(
                    children: <Widget>[
                      Image.network(
                        "https://img.youtube.com/vi/$videoId/hqdefault.jpg",
                        fit: BoxFit.cover,
                      ),
                      Container(
                        child: Align(
                          child: Text(
                            videoList[position].videoTitle,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          alignment: Alignment.bottomLeft,
                        ),
                        padding: EdgeInsets.only(left: 5.0, bottom: 16.0),
                      ),
                    ],
                  );
                },
                itemCount: videoList.length, // Can be null
              ),
            ),
            Container(
              color: pageBackgroundColor,
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            'https://i.picsum.photos/id/866/300/300.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Lena Adams',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child:
                                  Image.asset('assets/images/ic_facebook.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child:
                                  Image.asset('assets/images/ic_instagram.png'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                    thickness: 0.2,
                  ),
                  FlatButton.icon(
                    onPressed: () {
                      NavigationUtils.push(context, routeComments);
                    },
                    icon: Image.asset('assets/images/ic_comment.png'),
                    label: Text(
                      'Comments',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Completed Workout',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Container(
              height: 150,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return HomeItem();
                    }),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 16.0, top: 30.0, bottom: 30.0, right: 16.0),
              child: RaisedButton(
                color: redColor,
                padding: EdgeInsets.all(16.0),
                onPressed: () {
                  NavigationUtils.push(context, routeAddNotes);
                },
                child: Text(
                  'COMPLETE WORKOUT',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

getFiltersList() async {
  ApiManager apiManager = ApiManager();
  FormData req = FormData.fromMap({
    "userid": 2,
  });
  var response = await apiManager.getFilterlist(req);
}

List<VideoModel> _videoList() {
  final videoList = List<VideoModel>();
  videoList.add(VideoModel("Pellentesque facilisis vitae",
      "https://www.youtube.com/watch?v=j57HMjVM7Is"));
  videoList.add(VideoModel("Pellentesque facilisis vitae",
      "https://www.youtube.com/watch?v=lismOShjHnA"));
  return videoList;
}
