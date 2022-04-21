import 'package:cloud_firestore/cloud_firestore.dart';

import 'user_model.dart';

class Message {
  final ChatUser sender;
  final DateTime time;
  final String text;
  bool isRead;

  //construct
  Message({required this.sender,
      required this.time,
      required this.text,
      required this.isRead});

  //factory method
  factory Message.fromJSON(Map<String, dynamic> _json) {
    return Message(
      text: _json["text"],
      sender: _json["Sender"],
      isRead: _json["isRead"],
      time: _json["time"].toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "text": text,
      "sender": sender,
      "isRead": isRead,
      "time": Timestamp.fromDate(time),
    };
  }

  //You
  //TODO get from firebase
  static final ChatUser currentUser = ChatUser(
      name: 'Current User',
      uid: '0',
      imageUrl: 'images/User.png',
      email: '',
      lastSeen: DateTime.now());

  //other users
  //TODO remove this after fetching from firebase
  static final ChatUser ankit = ChatUser(
      name: 'Ankit',
      uid: '1',
      imageUrl: 'assets/images/User.png',
      email: '',
      lastSeen: DateTime.now());
  static final ChatUser vaibhaw = ChatUser(
      name: 'Vaibhaw',
      uid: '2',
      imageUrl: 'assets/images/User.png',
      email: '',
      lastSeen: DateTime.now());
  static final ChatUser omar = ChatUser(
      name: 'Omar',
      uid: '3',
      imageUrl: 'assets/images/User.png',
      email: '',
      lastSeen: DateTime.now());

  //online user
  //TODO get online users from firebase
  static List<ChatUser> online = [ankit, vaibhaw, omar];

  //Message List for home Screen
  //TODO get chats from firebase
  static List<Message> chats = [
    Message(
        sender: ankit, time: DateTime.now(), text: 'Whats Up', isRead: true),
    Message(
        sender: vaibhaw,
        time: DateTime.now(),
        text: 'Happy Holi',
        isRead: false),
    Message(
        sender: omar,
        time: DateTime.now(),
        text: 'Pls, Attend College Tommorrow',
        isRead: false)
  ];

  //Message List for chat Screen
  //TODO get chats from firebase 2
  static List<Message> messages = [
    Message(
        sender: ankit, time: DateTime.now(), text: 'Neeche aaja', isRead: true),
    Message(
        sender: currentUser,
        time: DateTime.now(),
        text: 'Aaya 2 min',
        isRead: true),
    Message(
        sender: ankit,
        time: DateTime.now(),
        text: 'Book leke aana',
        isRead: true)
  ];
}
