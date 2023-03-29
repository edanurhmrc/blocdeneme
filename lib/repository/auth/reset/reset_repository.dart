class ResetPasswordRepository {
  Future login() async {
    await Future.delayed(const Duration(seconds:3));
    throw Exception("Reset Failed");
  }
}