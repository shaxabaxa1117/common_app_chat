

class UserModel {
  final String id; //! UID из Firebase Authentication
  final String username; 
  final String email; 
  final String? phoneNumber; 
   final List<String> friends;

  UserModel({
  
    required this.id,
    required this.username,
    required this.email,
    this.phoneNumber,
    required this.friends
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'friends': friends,
    };
  }




  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      friends: List<String>.from(map['friends'] ?? []), 
    );
  }

}
