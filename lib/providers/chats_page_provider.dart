import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/database_service.dart';

import '../providers/authentication-provider.dart';

import '../Models/chat_message_model.dart';
import '../Models/chat_model.dart';
import '../Models/user_model.dart';

class ChatPageProvider extends ChangeNotifier {
  AuthenticationProvider _auth;

  late Databaseservices _db;

  List<Chat>? chats;

  late StreamSubscription _chatStream;

  ChatPageProvider(this._auth) {
    _db = GetIt.instance.get<Databaseservices>();
    getChats();
  }

  @override
  void dispose(){
    _chatStream.cancel();
    super.dispose();
  }

  void getChats() async {

  }
}