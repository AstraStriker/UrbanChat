class ChatUser{
  final String? uid;
  final String? name;
  final String? email;
  final String? imageUrl;
  late DateTime lastSeen;

  ChatUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.lastSeen
  });

  factory ChatUser.fromJSON(Map<String, dynamic> _json){
    return ChatUser(
        uid: _json["id"],
        name: _json["name"],
        imageUrl: _json["image"],
        email: _json["email"],
        lastSeen: _json["last_seen"].toDate()
    );
  }

  Map<String,dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "image": imageUrl,
      "last_seen": lastSeen
    };
  }

  String lastDaySeen()
  {
    return "${lastSeen.day}/${lastSeen.month}/${lastSeen.year}";
  }

  bool wasRecentlyActive()
  {
    return DateTime.now().difference(lastSeen).inHours < 2;
  }

}