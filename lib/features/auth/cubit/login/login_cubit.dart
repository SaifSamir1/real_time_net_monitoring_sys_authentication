import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/auth_repository.dart';
import 'login_states.dart';


class LogInCubit extends Cubit<LogInState> {
  final AuthRepository _authRepository;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _showValidation = false;

  LogInCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LogInInitial());

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    emit(PasswordVisibilityChanged(
      obscurePassword: _obscurePassword,
      showValidation: _showValidation,
    ));
  }

  void toggleValidation() {
    _showValidation = true;
    emit(ValidationToggled(
      showValidation: _showValidation,
      obscurePassword: _obscurePassword,
    ));
  }

  Future<void> logIn() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(LogInLoading(
        obscurePassword: _obscurePassword,
        showValidation: _showValidation,
      ));
      try {
        await _authRepository.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        emit(LogInSuccess(
          obscurePassword: _obscurePassword,
          showValidation: _showValidation,
        ));
      } catch (e) {
        emit(LogInError(
          e.toString(),
          obscurePassword: _obscurePassword,
          showValidation: _showValidation,
        ));
      }
    } else {
      toggleValidation();
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
