// ignore_for_file: file_names, unnecessary_null_comparison

import 'package:shared_preferences/shared_preferences.dart';
import 'package:email_validator/email_validator.dart';

class Register {
  static dynamic saveData(
      String email, String password, String username) async {
    SharedPreferences database = await SharedPreferences.getInstance();
    if (email == database.getString('email') &&
        password == database.getString('password')) {
      if (EmailValidator.validate(email)) {
        database.remove('email');
        database.remove('password');
        database.remove('username');

        database.setString('email', email);
        database.setString('password', password);
        database.setString('username', username);
        return 2;
      } else {
        return 1;
      }
    } else {
      if (email != null && password != null && username != null) {
        if (EmailValidator.validate(email)) {
          database.setString('email', email);
          database.setString('password', password);
          database.setString('username', username);
          return 2;
        } else {
          return 1;
        }
      } else if (email == null || password == null || username == null) {
        return 0;
      }
    }
  }
}
