import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../Models/user_model.dart';
import '../services/database_service.dart';
import '../services/navigation_service.dart';

class AuthenticationProvider extends ChangeNotifier {
  late final FirebaseAuth _auth;
  late final NavigationService _navigation;
  late final Databaseservices _databaseService;

  late ChatUser user;

  AuthenticationProvider() {
    _auth = FirebaseAuth.instance;
    _navigation = GetIt.instance.get<NavigationService>();
    _databaseService = GetIt.instance.get<Databaseservices>();

    _auth.authStateChanges().listen((_user) {
      if (_user != null) {
        _databaseService.getUser(_user.uid).then(
          (_snapshot) {
            Map<String, dynamic> _userData = _snapshot.data()! as Map<String, dynamic>;
            user = ChatUser.fromJSON(
              _userData
            );
            _navigation.removeAndNavigatorToRoute('/home');
          },
        );
        print(user.toMap());
      } else {
        print('Not Logged In');
      }
    });
  }

  Future<void> loginUsingEmailAndPassword(String _email, String _password)
  async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _email, password: _password
      );
      print(_email + "\n" + _password);
    } on FirebaseAuthException {
      print("Error logging-in to Firebase");
    } catch (e) {
      print(e);
    }
  }


  Future<void> signOut() async
  {
    await signOut();
  }

}
