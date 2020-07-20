import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:givefit/utils/constants.dart';
import 'package:givefit/utils/localization/localization.dart';
import 'package:givefit/utils/navigation.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'GiveFit',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: GoogleFonts.josefinSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: routeLaunch,
      localizationsDelegates: [
        const MyLocalizationsDelegate(),
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      onGenerateRoute: (settings) {
        return NavigationUtils.generateRoute(context, settings);
      },
      supportedLocales: [
        const Locale('en', ''),
        // const Locale('es', ''),
      ],
    );
  }
}

