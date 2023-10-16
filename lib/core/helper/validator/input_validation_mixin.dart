mixin InputValidationMixin {
  bool isPasswordValid(String? password) =>
      password != null && password.length == 6;

  bool isTextValid(String? text) {
    return text != null && text.isNotEmpty;
  }
}