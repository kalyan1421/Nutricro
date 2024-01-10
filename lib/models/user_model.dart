
class UserModel {
  late String uid;
  late String fullName;
  late String email;
  late int dt;

  UserModel({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.dt,
  });
  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      fullName: map['fullName'],
      email: map['email'],
      dt: map['dt'],
    );
  }
}
