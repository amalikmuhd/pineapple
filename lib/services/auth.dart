import 'package:pineapple/imports/imports.dart';

class AuthServices {
  static Future<bool> loginAnonmyous({required Function onPress}) async {
    try {
      UserCredential _cred = await FirebaseAuth.instance.signInAnonymously();
      User? _user = _cred.user;
      if (_user == null) {
        print("There is a problem signing");
      } else {
        onPress();
      }
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
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
