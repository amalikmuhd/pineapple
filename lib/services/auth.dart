import 'package:pineapple/imports/imports.dart';

class AuthServices {
  static Future<bool> loginAnonmyous(
      {required Function onSuccess,
      required Function(String e) onError}) async {
    try {
      UserCredential _cred = await FirebaseAuth.instance.signInAnonymously();
      User? _user = _cred.user;
      if (_user == null) {
        onError("There is a problem signing");
        return false;
      } else {
        onSuccess();
        return true;
      }
    } catch (e) {
      //I will create enum to format the error messages
      onError("There is a problem with your internet connection");
      return false;
    }
  }

  static Future<bool> signOut(Function goback) async {
    try {
      await FirebaseAuth.instance.signOut();
      goback();
      return true;
    } catch (e) {
      return false;
    }
  }
}
