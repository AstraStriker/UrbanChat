
import 'user_model.dart';

class Message{

  final User sender;
  final String time; //TODO user dataTime or firebase time here instead
  final String text;
  final bool isRead;

  //construct
  Message(
      {required this.sender, required this.time, required this.text, required this.isRead}
      );

  //You
  //TODO get from firebase
  static final User currentUser = User(
    name: 'Current User',id: 0 ,imageUrl: 'images/User.png'
  );

  //other users
  //TODO remove this after fetching from firebase
  static final User ankit = User(
      name: 'Ankit',id: 1 ,imageUrl: 'assets/images/User.png'
  );
  static final User vaibhaw = User(
      name: 'Vaibhaw',id: 2 ,imageUrl: 'assets/images/User.png'
  );
  static final User omar = User(
      name: 'Omar',id: 3 ,imageUrl: 'assets/images/User.png'
  );

  //online user
  //TODO get online users from firebase
  static List<User> online = [ ankit, vaibhaw, omar];

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