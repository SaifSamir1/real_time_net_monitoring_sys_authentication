



// SignUpState
abstract class SignUpState {
  final bool obscurePassword;
  final bool obscureConfirmPassword;
  final bool showValidation;

  SignUpState({
    this.obscurePassword = true,
    this.obscureConfirmPassword = true,
    this.showValidation = false,
  });
}

class SignUpInitial extends SignUpState {
  SignUpInitial({super.obscurePassword, super.obscureConfirmPassword, super.showValidation});
}

class SignUpLoading extends SignUpState {
  SignUpLoading({super.obscurePassword, super.obscureConfirmPassword, super.showValidation});
}

class SignUpSuccess extends SignUpState {
  SignUpSuccess({super.obscurePassword, super.obscureConfirmPassword, super.showValidation});
}

class SignUpError extends SignUpState {
  final String message;
  SignUpError(this.message, {super.obscurePassword, super.obscureConfirmPassword, super.showValidation});
}

class PasswordVisibilityChanged extends SignUpState {
  PasswordVisibilityChanged({required super.obscurePassword, super.obscureConfirmPassword, super.showValidation});
}

class ConfirmPasswordVisibilityChanged extends SignUpState {
  ConfirmPasswordVisibilityChanged({required super.obscureConfirmPassword, super.obscurePassword, super.showValidation});
}

class ValidationToggled extends SignUpState {
  ValidationToggled({required super.showValidation, super.obscurePassword, super.obscureConfirmPassword});
}