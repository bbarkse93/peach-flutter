class User {
  int id;
  String username;
  String password;
  String userPicUrl;
  String location;
  String created;

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.userPicUrl,
    required this.location,
    required this.created,
  });

  // 1. Dart 객체를 통신을 위한 Map 형태로 변환합니다.
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "userPicUrl": userPicUrl,
        "location": location,
        "created": created,
      };

  // 2. Map 형태로 받아서 Dart 객체로 변환합니다.
  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        username = json["username"],
        password = json["password"],
        userPicUrl = json["userPicUrl"],
        location = json["location"],
        created = json["created"];
}
