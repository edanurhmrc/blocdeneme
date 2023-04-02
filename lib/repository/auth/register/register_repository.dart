class RegisterRepository {
  Future register() async {
    await Future.delayed(const Duration(seconds:3));
    throw Exception("Register Failed");
  }
}