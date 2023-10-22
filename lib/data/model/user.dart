class User {
  int id;
  String username;
  String userPicUrl;
  String location;

  User({
    required this.id,
    required this.username,
    required this.userPicUrl,
    required this.location,
  });

  // 1. Dart 객체를 통신을 위한 Map 형태로 변환합니다.
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "userPicUrl": userPicUrl,
        "location": location,
      };

  // 2. Map 형태로 받아서 Dart 객체로 변환합니다.
  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        username = json["username"],
        userPicUrl = json["userPicUrl"],
        location = json["location"];
}
