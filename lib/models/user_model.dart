class UserModel {
  String id;
  String email;
  String name;
  int age;

  UserModel(
      {required this.id,
      required this.email,
      required this.name,
      required this.age});

  UserModel.fromJson(
    Map<String, dynamic> json,
  ) : this(
          id: json["id"],
          name: json["name"],
          email: json["email"],
          age: json["age"],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email, //KEY :VALUE,FROM MODEL
      "name": name,
      "age": age,
    };
  }
}
