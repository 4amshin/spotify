class SignInUserReq {
  final String email;
  final String password;

  SignInUserReq({
    required this.email,
    required this.password,
  });

  //Data Validation
  bool isValid() {
    return email.isNotEmpty && password.isNotEmpty;
  }
}
