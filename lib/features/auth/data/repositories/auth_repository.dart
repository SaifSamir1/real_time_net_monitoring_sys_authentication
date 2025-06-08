import '../models/user_model.dart';

abstract class AuthRepository {
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String nationalId,
  });

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<void> saveUserData(UserModel user);

  Stream<UserModel?> get user;
}
