import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Global {
  Global({
    this.name,
    this.value,
  });

  String? name;
  String? value;
  factory Global.fromMap(Map<String, dynamic> json) => Global(
        name: json["name"],
        value: json["value"],
      );

  static Future<Global> connectToAPI(String id) async {
    String apiurl = "https://api.kawalcorona.com/" + id;
    var apiResult = await http.get(Uri.parse(apiurl));
    var jsonObject = json.decode(apiResult.body);
    return Global.fromMap(jsonObject);
  }
}

class Lokal {
  int? positif;
  int? dirawat;
  int? sembuh;
  int? meninggal;

  Lokal({this.positif, this.dirawat, this.sembuh, this.meninggal});

  factory Lokal.getKasus(Map<String, dynamic> object) {
    return Lokal(
      positif: object['positif'],
      dirawat: object['dirawat'],
      sembuh: object['sembuh'],
      meninggal: object['meninggal'],
    );
  }

  static Future<Lokal> connectToAPI() async {
    String apiurl = "https://apicovid19indonesia-v2.vercel.app/api/indonesia";
    var apiResult = await http.get(Uri.parse(apiurl));
    var jsonObject = json.decode(apiResult.body);

    return Lokal.getKasus(jsonObject);
  }
}

class Vaksin {
  int? totalsasaran;
  int? dokter;
  int? lansia;
  int? publik;
  int? vaksin1;
  int? vaksin2;

  Vaksin(
      {this.totalsasaran,
      this.dokter,
      this.lansia,
      this.publik,
      this.vaksin1,
      this.vaksin2});

  factory Vaksin.getvak(Map<String, dynamic> object) {
    return Vaksin(
      totalsasaran: object['totalsasaran'],
      dokter: object['sasaranvaksinsdmk'],
      lansia: object['sasaranvaksinlansia'],
      publik: object['sasaranvaksinpetugaspublik'],
      vaksin1: object['vaksinasi1'],
      vaksin2: object['vaksinasi2'],
    );
  }

  static Future<Vaksin> connectToVak() async {
    String apiurl = "https://vaksincovid19-api.vercel.app/api/vaksin";
    var apiResult = await http.get(Uri.parse(apiurl));
    var jsonObject = json.decode(apiResult.body);

    return Vaksin.getvak(jsonObject);
  }
}
