


// LogInState
abstract class LogInState {
  final bool obscurePassword;
  final bool showValidation;

  LogInState({
    this.obscurePassword = true,
    this.showValidation = false,
  });
}

class LogInInitial extends LogInState {
  LogInInitial({super.obscurePassword, super.showValidation});
}

class LogInLoading extends LogInState {
  LogInLoading({super.obscurePassword, super.showValidation});
}

class LogInSuccess extends LogInState {
  LogInSuccess({super.obscurePassword, super.showValidation});
}

class LogInError extends LogInState {
  final String message;
  LogInError(this.message, {super.obscurePassword, super.showValidation});
}

class PasswordVisibilityChanged extends LogInState {
  PasswordVisibilityChanged({required super.obscurePassword, super.showValidation});
}

class ConfirmPasswordVisibilityChanged extends LogInState {
  ConfirmPasswordVisibilityChanged({required super.obscurePassword, super.showValidation});
}

class ValidationToggled extends LogInState {
  ValidationToggled({required super.showValidation, super.obscurePassword,});
}