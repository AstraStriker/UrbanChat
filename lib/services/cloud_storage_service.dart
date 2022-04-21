import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';

const String USER_COLLECTION = "Users";

class CloudStorageServices {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  CloudStorageServices() {}

  Future<String?> saveUserImageToStorage(String _uid, PlatformFile _file) async
  {
    try{
      Reference _ref = _storage.ref().child('images/users/$_uid/profile.${_file.extension}');
      UploadTask _task = _ref.putFile(File(_file.path.toString()));
      return await _task.then((_result) => _result.ref.getDownloadURL());
    } catch (e) {
      print(e);
    }
  }

  Future<String?> saveChatImageToStorage(String _chatID, String _uid, PlatformFile _file) async
  {
    try{
      Reference _ref = _storage.ref().child('images/chats/$_chatID/${_uid}_${Timestamp.now().millisecondsSinceEpoch}.${_file.extension}');
      UploadTask _task = _ref.putFile(File(_file.path.toString()));
      return await _task.then((_result) => _result.ref.getDownloadURL());
    } catch (e) {
      print(e);
    }
  }
}
