import 'package:chat_app/Screens/Welcome/components/body.dart';
import 'package:flutter/material.dart';

class Welcomescreen extends StatefulWidget {
  @override
  State<Welcomescreen> createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
