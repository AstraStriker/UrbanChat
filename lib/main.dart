import 'package:chat_app/Screens/Welcome/welcome_screen.dart';
import 'package:chat_app/Screens/SplashPage/splash_page.dart';
import 'package:chat_app/providers/authentication-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'Screens/SplashPage/splash_page.dart';
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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthenticationProvider>(
              create: (BuildContext _context){
                return AuthenticationProvider();
              }
          )
        ],
      child:   MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter',
        theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        ),
        navigatorKey: NavigationService.navigatorKey,
        initialRoute: '/login',
        routes: {
        '/login': (BuildContext _context) => Welcomescreen(),
        },
        //home: Welcomescreen(),
        )
    );
  }
}

