import 'package:flutter/material.dart';
import 'package:givefit/src/main/menu/menu_item.dart';
import 'package:givefit/src/main/menu/menu_model.dart';
import 'package:givefit/utils/color_utils.dart';
import 'package:givefit/utils/constants.dart';
import 'package:givefit/utils/dialog_utils.dart';
import 'package:givefit/utils/navigation.dart';
import 'package:givefit/widgets/custom_background.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menuList = _menuList();

    return CustomBackground(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                NavigationUtils.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/images/ic_close.png',
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ),
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://picsum.photos/200/300'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text(
                'Ella Thomas',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Text(
              'carley.roberts@schmeler.ca',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: grayColor),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Divider(
                      color: grayColor,
                    ),
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: menuList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0:
                            NavigationUtils.pushAndRemoveUntil(context,routeExercise);
                            break;
                          case 1:
                            NavigationUtils.push(context, routeCompleteWorkout);
                            break;
                          case 3:
                            NavigationUtils.push(context, routeChangePassword);
                            break;
                          case 4:
                            DialogUtils.showOkCancelAlertDialog(
                                context: context,
                                message: "Are you sure you want to logout?",
                                okButtonTitle: "Yes",
                                cancelButtonTitle: "No",
                                okButtonAction: () {
                                  NavigationUtils.pushAndRemoveUntil(
                                      context, routeInstantLogin);
                                },
                                isCancelEnable: true);
                            break;
                        }
                      },
                      child: MenuItem(
                        icon: menuList[index].icon,
                        title: menuList[index].title,
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<MenuModel> _menuList() {
  final menuList = List<MenuModel>();
  menuList.add(MenuModel("Home Screen", "assets/images/ic_home.png"));
  menuList.add(
      MenuModel("Completed Workouts", "assets/images/ic_completed_word.png"));
  menuList.add(
      MenuModel("Saved Workouts", "assets/images/ic_completed_word.png"));
  menuList.add(
      MenuModel("Change Password", "assets/images/ic_change_password.png"));
  menuList.add(MenuModel("Logout", "assets/images/ic_logout.png"));
  return menuList;
}
