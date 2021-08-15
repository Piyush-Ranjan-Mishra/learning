import 'dart:async';

class LoginBloc {
  LoginBloc._();

  bool isEmailValidated = false,
      isPasswordValidated = false,
      isPasswordConfirmed = false;

  static final LoginBloc instance = LoginBloc._();

  var refresh = StreamController<bool>.broadcast(),
      _loginActivity = StreamController<bool>.broadcast(),
      _errorText = StreamController<String>.broadcast();
  Stream<bool> get loginListener => _loginActivity.stream;
  Stream<String> get error => _errorText.stream;

  bool login(email, password) {
    errorHandling('');
    _loginActivity.sink.add(true);
    if (!(isEmailValidated && isPasswordValidated)) {
      _errorText.sink.add('Login Failed');
      return false;
    }
    return true;
  }

  bool logout() {
    _loginActivity.sink.add(false);
    return true;
  }

  bool passwordReset(oldPassword, newPassword) {
    if (!(isPasswordValidated && isPasswordConfirmed)) {
      return errorHandling('Password reset failed');
    }
    errorHandling('');

    return true;
  }

  bool errorHandling(String error) {
    _errorText.sink.add(error);
    return false;
  }

  bool isEmailValid(email) {
    isEmailValidated = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!isEmailValidated) {
      return errorHandling('Invalid email');
    }
    errorHandling('');
    return isEmailValidated;
  }

  /// password should have uppercase digits special character and of min lenght
  bool isPasswordCompliant(String password, [int minLength = 6]) {
    if (password == null || password.isEmpty) {
      return errorHandling(
          'Password should contain Uppercase, lowercase, number and special character');
    }
    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length >= minLength;

    isPasswordValidated = hasDigits &
        hasUppercase &
        hasLowercase &
        hasSpecialCharacters &
        hasMinLength;
    if (!isPasswordValidated) {
      return errorHandling(
          'Password should contain Uppercase, lowercase, number and special character');
    }
    errorHandling('');
    return true;
  }

  dispose() {
    refresh.close();
    _loginActivity.close();
    _errorText.close();
  }
}
