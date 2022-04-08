import 'package:cloud_firestore/cloud_firestore.dart';

const String USER_COLLECTION = "Users";
const String CHAT_COLLECTION = "Chats";
const String MESSAGES_COLLECTION = "Messages";

class Databaseservices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Databaseservices() {}

  Future<DocumentSnapshot> getUser(String _uid) {
    return _db.collection(USER_COLLECTION).doc(_uid).get();
  }

  Future<void> updateUserDateAndTime(String _uid) async {
    try{
      await _db.collection(USER_COLLECTION).doc(_uid).update({
        "last_seen": DateTime.now().toUtc(),
      },);
    }catch(e){
      print(e);
    }
  }
}
