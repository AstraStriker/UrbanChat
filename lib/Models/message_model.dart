
import 'user_model.dart';

class Message{

  final ChatUser sender;
  final String time; //TODO user dataTime or firebase time here instead
  final String text;
  bool isRead;

  //construct
  Message(
      {required this.sender, required this.time, required this.text, required this.isRead}
      );

  //You
  //TODO get from firebase
  static final ChatUser currentUser = ChatUser(
    name: 'Current User',uid: '0' ,imageUrl: 'images/User.png', email: '', lastSeen: DateTime.now()
  );

  //other users
  //TODO remove this after fetching from firebase
  static final ChatUser ankit = ChatUser(
      name: 'Ankit',uid: '1' ,imageUrl: 'assets/images/User.png', email: '', lastSeen: DateTime.now()
  );
  static final ChatUser vaibhaw = ChatUser(
      name: 'Vaibhaw',uid: '2' ,imageUrl: 'assets/images/User.png', email: '', lastSeen: DateTime.now()
  );
  static final ChatUser omar = ChatUser(
      name: 'Omar',uid: '3' ,imageUrl: 'assets/images/User.png', email: '', lastSeen: DateTime.now()
  );

  //online user
  //TODO get online users from firebase
  static List<ChatUser> online = [ ankit, vaibhaw, omar];

  //Message List for home Screen
  //TODO get chats from firebase
  static List<Message> chats = [
    Message(sender: ankit,time : '3:30pm', text: 'Whats Up', isRead: true),
    Message(sender: vaibhaw, time: '4:30pm', text: 'Happy Holi', isRead: false),
    Message(sender: omar, time: '5:00pm', text: 'Pls, Attend College Tommorrow', isRead: false)
  ];

  //Message List for chat Screen
  //TODO get chats from firebase 2
  static List<Message> messages = [
    Message(sender: ankit, time: '9:00pm', text: 'Neeche aaja', isRead: true),
    Message(sender: currentUser, time: '9:01pm', text: 'Aaya 2 min', isRead: true),
    Message(sender: ankit, time: '9:02pm', text: 'Book leke aana', isRead: true)
  ];
}