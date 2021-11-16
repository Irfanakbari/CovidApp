import 'package:shared_preferences/shared_preferences.dart';

class GetData {
  static Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('username');

    return email;
  }
}
