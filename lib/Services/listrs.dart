import 'package:http/http.dart' as http;
import 'dart:convert';

class ListRS {
  static connectToAPI() async {
    var response = await http.get(Uri.parse(
        "https://firebasestorage.googleapis.com/v0/b/covider-68f38.appspot.com/o/ListRS.json?alt=media&token=c1069a3d-26b6-484f-a311-5efd85d36dcc"));
    var jsonData = jsonDecode(response.body);

    List<ListRS> users = [];

    for (var u in jsonData) {
      ListRS user = ListRS(u["name"], u["address"], u["region"], u["province"]);
      users.add(user);
    }
    return users;
  }

  final String name, region, address, province;
  ListRS(this.name, this.region, this.address, this.province);
}
