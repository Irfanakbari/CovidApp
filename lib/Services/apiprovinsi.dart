import 'dart:convert';
import 'package:http/http.dart' as http;

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

class Welcome {
  static Future<Welcome> connectToVak() async {
    String apiurl = "https://data.covid19.go.id/public/api/prov.json";
    var apiResult = await http.get(Uri.parse(apiurl));
    var jsonObject = json.decode(apiResult.body);

    return Welcome.fromJson(jsonObject);
  }

  Welcome({
    this.lastDate,
    this.currentData,
    this.missingData,
    this.tanpaProvinsi,
    this.listData,
  });

  dynamic lastDate;
  dynamic currentData;
  dynamic missingData;
  dynamic tanpaProvinsi;
  List<ListDatum>? listData;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        lastDate: json["last_date"].toString(),
        currentData: json["current_data"].toString(),
        missingData: json["missing_data"],
        tanpaProvinsi: json["tanpa_provinsi"],
        listData: List<ListDatum>.from(
            json["list_data"].map((x) => ListDatum.fromJson(x))),
      );
}

class ListDatum {
  ListDatum({
    this.key,
    this.docCount,
    this.jumlahKasus,
    this.jumlahSembuh,
    this.jumlahMeninggal,
    this.jumlahDirawat,
    this.jenisKelamin,
    this.kelompokUmur,
    this.lokasi,
    this.penambahan,
  });

  dynamic key;
  dynamic docCount;
  dynamic jumlahKasus;
  dynamic jumlahSembuh;
  dynamic jumlahMeninggal;
  dynamic jumlahDirawat;
  List<JenisKelamin>? jenisKelamin;
  List<KelompokUmur>? kelompokUmur;
  dynamic lokasi;
  dynamic penambahan;

  factory ListDatum.fromJson(Map<String, dynamic> json) => ListDatum(
        key: json["key"].toString(),
        docCount: json["doc_count"].toDouble(),
        jumlahKasus: json["jumlah_kasus"],
        jumlahSembuh: json["jumlah_sembuh"],
        jumlahMeninggal: json["jumlah_meninggal"],
        jumlahDirawat: json["jumlah_dirawat"],
        jenisKelamin: List<JenisKelamin>.from(
            json["jenis_kelamin"].map((x) => JenisKelamin.fromJson(x))),
        kelompokUmur: List<KelompokUmur>.from(
            json["kelompok_umur"].map((x) => KelompokUmur.fromJson(x))),
        penambahan: Penambahan.fromJson(json["penambahan"]),
      );
}

class JenisKelamin {
  JenisKelamin({
    this.docCount,
  });

  int? docCount;

  factory JenisKelamin.fromJson(Map<String, dynamic> json) => JenisKelamin(
        docCount: json["doc_count"],
      );

  Map<String, dynamic> toJson() => {
        "doc_count": docCount,
      };
}

class KelompokUmur {
  KelompokUmur({
    this.docCount,
    this.usia,
  });

  dynamic docCount;
  dynamic usia;

  factory KelompokUmur.fromJson(Map<String, dynamic> json) => KelompokUmur(
        docCount: json["doc_count"],
      );
}

class Penambahan {
  Penambahan({
    this.positif,
    this.sembuh,
    this.meninggal,
  });

  dynamic positif;
  dynamic sembuh;
  dynamic meninggal;

  factory Penambahan.fromJson(Map<String, dynamic> json) => Penambahan(
        positif: json["positif"],
        sembuh: json["sembuh"],
        meninggal: json["meninggal"],
      );
}
