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

    // _auth.signOut();


    _auth.authStateChanges().listen((_user) async {
      if (_user != null) {
        await _databaseService.updateUserDateAndTime(_user.uid);
        await _databaseService.getUser(_user.uid).then(
          (_snapshot) {
            Map<String, dynamic> _userData = _snapshot.data()! as Map<String, dynamic>;
            user = ChatUser.fromJSON(_userData);
            _navigation.removeAndNavigateToRoute('/home');
          },
        );
        print(user.toMap());
      } else {
        _navigation.removeAndNavigateToRoute('/login');
      }
    });
  }

  Future<void> loginUsingEmailAndPassword(String _email, String _password)
  async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _email, password: _password
      );
    } on FirebaseAuthException {
      print("Error logging-in to Firebase");
    } catch (e) {
      print(e);
    }
  }


  Future<void> logOut() async
  {
    try{
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future<String?> registerUserUsingEmailAndPassword(String _email, String _password) async {
    try{
      UserCredential _credentials= await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
      return _credentials.user!.uid;
    }catch(e){
      print(e);
    }
    }
}
