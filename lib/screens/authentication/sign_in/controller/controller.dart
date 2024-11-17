class SignInController {
  static validateSignIn({required String userName, required String password}) {
    return userName!=""&&password!="";
  }
}
