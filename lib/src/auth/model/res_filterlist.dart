import 'dart:convert';

// {"Equipments":[{"id":1,"title":"No Equipment"},{"id":2,"title":"Plyobox"},{"id":3,"title":"Skipping Rope"},{"id":4,"title":"Pull-up Bar"},{"id":5,"title":"Dumbbells"},{"id":6,"title":"Kettlebells"}],"Types":[{"id":1,"title":"Core"},{"id":2,"title":"Upper"},{"id":3,"title":"Full"},{"id":4,"title":"Lower"},{"id":5,"title":"Hiit"},{"id":6,"title":"Cardio"}],"Gender":[{"id":1,"title":"Male"},{"id":2,"title":"Female"},{"id":3,"title":"Both"}],"message":"","status":true}
class Res_filterlist {
  List<Equipments> _equipments;
  List<Types> _types;
  List<Gender> _gender;
  String _message;
  bool _status;

  res(
      {List<Equipments> equipments,
      List<Types> types,
      List<Gender> gender,
      String message,
      bool status}) {
    this._equipments = equipments;
    this._types = types;
    this._gender = gender;
    this._message = message;
    this._status = status;
  }

  List<Equipments> get equipments => _equipments;
  set equipments(List<Equipments> equipments) => _equipments = equipments;
  List<Types> get types => _types;
  set types(List<Types> types) => _types = types;
  List<Gender> get gender => _gender;
  set gender(List<Gender> gender) => _gender = gender;
  String get message => _message;
  set message(String message) => _message = message;
  bool get status => _status;
  set status(bool status) => _status = status;

  Res_filterlist
  .fromJson(dynamic jsondata) {
    final json = jsonDecode(jsondata);
    if (json['Equipments'] != null) {
      _equipments = new List<Equipments>();
      json['Equipments'].forEach((v) {
        _equipments.add(new Equipments.fromJson(v));
      });
    }
    if (json['Types'] != null) {
      _types = new List<Types>();
      json['Types'].forEach((v) {
        _types.add(new Types.fromJson(v));
      });
    }
    if (json['Gender'] != null) {
      _gender = new List<Gender>();
      json['Gender'].forEach((v) {
        _gender.add(new Gender.fromJson(v));
      });
    }
    _message = json['message'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._equipments != null) {
      data['Equipments'] = this._equipments.map((v) => v.toJson()).toList();
    }
    if (this._types != null) {
      data['Types'] = this._types.map((v) => v.toJson()).toList();
    }
    if (this._gender != null) {
      data['Gender'] = this._gender.map((v) => v.toJson()).toList();
    }
    data['message'] = this._message;
    data['status'] = this._status;
    return data;
  }
}

class Equipments {
  int _id;
  String _title;

  Equipments({int id, String title}) {
    this._id = id;
    this._title = title;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get title => _title;
  set title(String title) => _title = title;

  Equipments.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    return data;
  }
}

class Gender {
  int _id;
  String _title;

  Gender({int id, String title}) {
    this._id = id;
    this._title = title;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get title => _title;
  set title(String title) => _title = title;

  Gender.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    return data;
  }
}

class Types {
  int _id;
  String _title;

  Types({int id, String title}) {
    this._id = id;
    this._title = title;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get title => _title;
  set title(String title) => _title = title;

  Types.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    return data;
  }
}