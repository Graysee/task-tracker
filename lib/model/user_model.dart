class UserModel {
   String? id;
   String? email;
   String? fullName;

  UserModel({this.id, this.email, this.fullName});

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        fullName = json['fullName'];

  Map<String, dynamic> toJson() {
    return {'id': id, 'fullName': fullName, 'email': email};
  }
}
