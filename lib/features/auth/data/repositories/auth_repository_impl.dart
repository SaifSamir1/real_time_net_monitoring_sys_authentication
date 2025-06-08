import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthRepositoryImpl({FirebaseAuth? firebaseAuth, FirebaseFirestore? firestore})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
      _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String nationalId,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = UserModel(
        id: userCredential.user!.uid,
        name: name,
        email: email,
        nationalId: nationalId,
      );

      await saveUserData(user);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> saveUserData(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.id).set(user.toJson());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Stream<UserModel?> get user {
    return _firebaseAuth.authStateChanges().asyncMap((firebaseUser) async {
      if (firebaseUser == null) {
        return null;
      }
      try {
        final userData =
            await _firestore.collection('users').doc(firebaseUser.uid).get();
        return UserModel.fromJson({
          'id': firebaseUser.uid,
          ...userData.data() ?? {},
        });
      } catch (e) {
        throw Exception(e.toString());
      }
    });
  }
}
