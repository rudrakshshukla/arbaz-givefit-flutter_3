import 'package:flutter/material.dart';
import 'package:givefit/src/auth/add_password.dart';
import 'package:givefit/src/auth/instant_login.dart';
import 'package:givefit/src/auth/login.dart';
import 'package:givefit/src/main/changepassword/change_password.dart';
import 'package:givefit/src/main/comments/comments.dart';
import 'package:givefit/src/main/exercise/exercise.dart';
import 'package:givefit/src/main/home.dart';
import 'package:givefit/src/main/menu/menu.dart';
import 'package:givefit/src/main/notes/add_notes.dart';
import 'package:givefit/src/main/notes/empty_notes.dart';
import 'package:givefit/src/main/notes/notes.dart';
import 'package:givefit/src/main/search/search.dart';
import 'package:givefit/src/main/workout/complete_workout.dart';
import 'package:givefit/src/splash.dart';

import 'constants.dart';

class NavigationUtils {
  static Route<dynamic> generateRoute(
    BuildContext context,
    RouteSettings settings,
  ) {
    final Map<String, dynamic> args = settings.arguments;
    switch (settings.name) {
      case routeLaunch:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case routeLogin:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case routeAddPassword:
        return MaterialPageRoute(builder: (_) => AddPasswordScreen());

      case routeInstantLogin:
        return MaterialPageRoute(builder: (_) => InstantLoginScreen());
      case routeHome:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case routeComments:
        return MaterialPageRoute(builder: (_) => CommentsScreen());
      case routeEmptyNotes:
        return MaterialPageRoute(builder: (_) => EmptyNotesScreen());
      case routeAddNotes:
        return MaterialPageRoute(builder: (_) => AddNotesScreen());
      case routeNotes:
        return MaterialPageRoute(builder: (_) => NotesScreen());
      case routeCompleteWorkout:
        return MaterialPageRoute(builder: (_) => CompleteWorkoutScreen());
      case routeExercise:
        return MaterialPageRoute(builder: (_) => ExerciseScreen());
      case routeSearch:
        return MaterialPageRoute(builder: (_) => SearchScreen());

      case routeChangePassword:
        return MaterialPageRoute(builder: (_) => ChangePasswordScreen());
      case routeMenu:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => MenuScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(0.0, 1.0);
            var end = Offset.zero;
            var curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      default:
        return _errorRoute(" Comming soon...");
    }
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(title: Text('Error')),
          body: Center(child: Text(message)));
    });
  }

  static void pushReplacement(BuildContext context, String routeName,
      {Object arguments}) {
    Navigator.of(context).pushReplacementNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> push(BuildContext context, String routeName,
      {Object arguments}) {
    return Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  static void pop(BuildContext context, {dynamic args}) {
    Navigator.of(context).pop(args);
  }

  static Future<dynamic> pushAndRemoveUntil(
      BuildContext context, String routeName,
      {Object arguments}) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }
}
