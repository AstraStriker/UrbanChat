import 'package:chat_app/Screens/HomeScreen/home_screen.dart';
import 'package:chat_app/Screens/Login/login_screen.dart';
import 'package:chat_app/providers/authentication-provider.dart';
import 'package:chat_app/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import '../../../componenets/already_have_an_account_acheck.dart';
import '../../../componenets/rounded_button.dart';
import '../../../componenets/rounded_input_field.dart';
import '../../../componenets/rounded_password_field.dart';
import '../../Signup/components/background.dart';
import '../../Signup/signup_screen.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  String? _email;
  String? _password;

  late AuthenticationProvider _auth;
  late NavigationService _navigation;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    _auth = Provider.of<AuthenticationProvider>(context);
    _navigation = GetIt.instance.get<NavigationService>();

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                _email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                _password = value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                //todo remove print
                print(_email);
                print(_password);

                //todo add authentication before login user in
                _auth.loginUsingEmailAndPassword(_email!, _password!);

                //todo get current user details before logging in

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
