import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String nationalId;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.nationalId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      nationalId: json['nationalId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'nationalId': nationalId};
  }

  @override
  List<Object?> get props => [id, name, email, nationalId];
}
