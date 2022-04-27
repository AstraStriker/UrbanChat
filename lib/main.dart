import 'package:chat_app/Screens/HomeScreen/home_page.dart';
import 'package:chat_app/Screens/LoginPage/login_page.dart';
import 'package:chat_app/Screens/Register/register_page.dart';
import 'package:chat_app/Screens/SplashPage/splash_page.dart';
import 'package:chat_app/providers/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/SplashPage/splash_page.dart';
import 'services/navigation_service.dart';

void main() {
  runApp(
   const MyApp()
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
            scaffoldBackgroundColor: Colors.white,
          ),
          navigatorKey: NavigationService.navigatorKey,
          initialRoute: '/login',
          routes: {
            '/login': (BuildContext _context) => LoginPage(),
            '/home': (BuildContext _context) => HomePage(),
            '/register': (BuildContext _context) => RegisterPage(),
          },
        )
    );
  }
}


