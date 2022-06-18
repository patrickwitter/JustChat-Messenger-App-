class AppUser {
  AppUser({
    required this.email,
    required this.name,
    required this.imgUrl,
    required this.username,
  });

  String email;
  String username;
  String name;
  String imgUrl;

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "username": email.replaceAll("@gmail.com", ""),
      "name": name,
      "imgUrl": imgUrl
    };
  }

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      email: json["email"],
      name: json["name"],
      imgUrl: json["imgUrl"],
      username: json["username"],
    );
  }
}
