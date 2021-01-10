import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String title;
  final String firstName;
  final String lastName;
  final String picture;
  final String email;

  UserModel({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
    this.picture,
    this.email,
  });

  factory UserModel.fromMap(dynamic map) {
    if (map == null) return null;
    return UserModel(
      id: map['id'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      picture: map['picture'],
      title: map['title'],
    );
  }

  @override
  List<Object> get props => [id, email, firstName, lastName, picture, title];
}
