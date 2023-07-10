class User{
  int? id;
  String? name;
  String? email;
  String? username;


  User({
    this.id, this.name, this.email, this.username
});

  ///receives data in json format from firebase

   User.fromJson(Map<String, dynamic> json){
     id = json['id'];
     name = json['name'];
     email = json['email'];
     username = json['username'];
   }
///returns data to firebase from the user input
   Map<String, dynamic> toJson (){
     final Map<String, dynamic> data = <String, dynamic> {};
     data['id'] = id;
     data['name'] = name;
     data['email'] = email;
     data['username'] = username;

     return data;
   }
}