class AppUser{
  dynamic id;
  String name;
  String mobile;



  AppUser({this.id, this.name, this.mobile});

  factory AppUser.fromJson(Map<String, dynamic> data) =>
      new AppUser(
          id: data["id"],
          name:data["name"],
          mobile:data["mobile"],

      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mobile": mobile,

  };

  @override
  String toString() {
    return 'AppUser{id: $id, name: $name, mobile: $mobile}';
  }
}