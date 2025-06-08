import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/auth_repository.dart';
import '../auth_state.dart';
import 'signup_state.dart';



// SignUpCubit
class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository _authRepository;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _showValidation = false;

  SignUpCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SignUpInitial());

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    emit(PasswordVisibilityChanged(
      obscurePassword: _obscurePassword,
      obscureConfirmPassword: _obscureConfirmPassword,
      showValidation: _showValidation,
    ));
  }

  void toggleConfirmPasswordVisibility() {
    _obscureConfirmPassword = !_obscureConfirmPassword;
    emit(ConfirmPasswordVisibilityChanged(
      obscureConfirmPassword: _obscureConfirmPassword,
      obscurePassword: _obscurePassword,
      showValidation: _showValidation,
    ));
  }

  void toggleValidation() {
    _showValidation = true;
    emit(ValidationToggled(
      showValidation: _showValidation,
      obscurePassword: _obscurePassword,
      obscureConfirmPassword: _obscureConfirmPassword,
    ));
  }

  Future<void> signUp() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(SignUpLoading(
        obscurePassword: _obscurePassword,
        obscureConfirmPassword: _obscureConfirmPassword,
        showValidation: _showValidation,
      ));
      try {
        await _authRepository.signUpWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
          name: nameController.text,
          nationalId: nationalIdController.text,
        );
        emit(SignUpSuccess(
          obscurePassword: _obscurePassword,
          obscureConfirmPassword: _obscureConfirmPassword,
          showValidation: _showValidation,
        ));
      } catch (e) {
        emit(SignUpError(
          e.toString(),
          obscurePassword: _obscurePassword,
          obscureConfirmPassword: _obscureConfirmPassword,
          showValidation: _showValidation,
        ));
      }
    } else {
      toggleValidation();
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    nationalIdController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}