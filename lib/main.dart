import 'package:chat_app/Screens/Welcome/welcome_screen.dart';
import 'package:chat_app/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'pages/splash_page.dart';
import 'services/navigation_service.dart';

void main() {
  runApp(
    SplashPage(
      key: UniqueKey(),
      onInitializationComplete: () {
        runApp(
          const MyApp(),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      navigatorKey: NavigationService.navigatorKey,
      home: Welcomescreen(),
    );
  }
}
