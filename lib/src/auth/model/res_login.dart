/// User : {"id":1,"first_name":"","last_name":"","email":"rudraksh.shukla98@gmail.com","image":""}
/// status : true
/// message : "Successfully login."

class Res_login {
  User _user;
  bool _status;
  String _message;

  User get user => _user;
  bool get status => _status;
  String get message => _message;

  Res_login({
      User user, 
      bool status, 
      String message}){
    _user = user;
    _status = status;
    _message = message;
}

  Res_login.fromJson(dynamic json) {
    _user = json["User"] != null ? User.fromJson(json["User"]) : null;
    _status = json["status"];
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_user != null) {
      map["User"] = _user.toJson();
    }
    map["status"] = _status;
    map["message"] = _message;
    return map;
  }

}

/// id : 1
/// first_name : ""
/// last_name : ""
/// email : "rudraksh.shukla98@gmail.com"
/// image : ""

class User {
  int _id;
  String _firstName;
  String _lastName;
  String _email;
  String _image;

  int get id => _id;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get image => _image;

  User({
      int id, 
      String firstName, 
      String lastName, 
      String email, 
      String image}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _image = image;
}

  User.fromJson(dynamic json) {
    _id = json["id"];
    _firstName = json["firstName"];
    _lastName = json["lastName"];
    _email = json["email"];
    _image = json["image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    map["email"] = _email;
    map["image"] = _image;
    return map;
  }

}