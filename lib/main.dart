import 'package:chat_app/Screens/HomeScreen/home_screen.dart';
import 'package:chat_app/Screens/LoginPage/login_page.dart';
import 'package:chat_app/Screens/Register/register_page.dart';
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
            '/login': (BuildContext _context) => LoginPage(),
            '/home': (BuildContext _context) => const HomeScreen(),
            '/register': (BuildContext _context) => RegisterPage(),
          },
          //home: Welcomescreen(),
        )
    );
  }
}


