class ChatUser{
  final String uid;
  final String name;
  final String email;
  final String imageUrl;

  ChatUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.imageUrl
  });

  factory ChatUser.fromJSON(Map<String, dynamic> _json){
    return ChatUser(
        uid: _json["id"],
        name: _json["name"],
        imageUrl: _json["image"],
        email: _json["email"]
    );
  }

  Map<String,dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "image": imageUrl
    };
  }

}