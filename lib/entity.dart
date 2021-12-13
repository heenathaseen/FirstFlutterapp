class UserData {

  String name;
  String email;



  UserData({ this.name, this.email});

  factory UserData.fromJson(Map<String, dynamic> data) {
    return UserData(
        name: data["name"],
        email: data["email"],
      );
  }

  Map<String, dynamic> toJson() {
    return {

      "name": name,
      "email": email,
    };
  }
}
