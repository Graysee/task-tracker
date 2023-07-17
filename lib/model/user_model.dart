class User {
  final String? id;
  final String? fullName;
  final String? email;
  final String? password;

  User({this.id, this.fullName, this.email, this.password});

  User.fromData(Map<String, dynamic> data):
      id = data['id'],
  fullName=data['fullName'],
  email=data['email'],
  password=data['password'];

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'fullName' : fullName,
      'email' : email,
      'password':password,
    };
  }

}