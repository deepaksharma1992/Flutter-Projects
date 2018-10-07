class User {
  int _id;
  String _userName, _password;

  User(this._userName, this._password);

  String get userName => _userName;

  String get password => _password;

  int get id => _id;

  User.map(dynamic obj) {
    this._userName = obj['userName'];
    this._password = obj['password'];
    this._id = obj['id'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['userName'] = _userName;
    map['password'] = _password;

    if (_id != null) {
      map['id'] = _id;
    }
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    this._userName = map['userName'];
    this._password = map['password'];
    this._id = map['id'];
  }
}
