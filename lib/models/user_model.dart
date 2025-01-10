

class UserModel {
  final String id; //! UID из Firebase Authentication
  final String username; 
  final String email; 
  final String? phoneNumber; 

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }


  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
    );
  }
}
