import 'package:shared_preferences/shared_preferences.dart';
import 'package:email_validator/email_validator.dart';

class CekLogin {
  static dynamic cekLogin(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? emailPref = prefs.getString('email');
    String? passwordPref = prefs.getString('password');
    if (EmailValidator.validate(email)) {
      if (email == emailPref && password == passwordPref) {
        return 2;
      } else {
        return 0;
      }
    } else {
      return 1;
    }
  }
}
