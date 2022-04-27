import 'chat_message_model.dart';
import '../Models/chat_user.dart';

//todo create new chat_message model to comply with updates code

class Chat {
  final String uid;
  final String currentUserUid;
  final bool activity;
  final bool group;
  final List<ChatUser> members;
  List<ChatMessage> messages;
  late final List<ChatUser> _recipients;

  Chat(
      {required this.uid,
      required this.currentUserUid,
      required this.activity,
      required this.group,
      required this.members,
      required this.messages}) {
    _recipients = members.where((_i) => _i.uid != currentUserUid).toList();
  }

  List<ChatUser> recipients() {
    return _recipients;
  }

  String? title() {
    return !group
        ? _recipients.first.name
        : _recipients.map((_user) => _user.name).join(", ");
  }

  String? imageURL() {
    return !group
        ? _recipients.first.imageURL
        : "https://www.freeiconspng.com/thumbs/group-png/group-of-people-in-a-formation-23.png";
  }
}
