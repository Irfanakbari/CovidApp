import 'package:flutter/material.dart';

class InfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Center(
          child: Text(
            'Aplikasi CovidApp',
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Text(
            'Aplikasi ini dibuat sebagai Projek Akhir Kelas Belajar Membuat Aplikasi Flutter untuk Pemula pada layanan pembelajaran Dicoding',
            style: TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'Biodata : ',
          style: TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Nama : Irfan Akbari Habibi',
          style: TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Asal : Medan, Sumatera Utara',
          style: TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Pekerjaan : Mahasiswa S1 Ilmu Komputer USU',
          style: TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Text(
            'Aplikasi ini dibuat dengan menggunakan Flutter dan Bahasa Pemrograman Dart. Referensi berasal dari materi dicoding, video Youtube, dokumentasi flutter, tutorial dari internet, dan bantuan dari stackoverflow, Sumber data pada aplikasi ini berasal dari : ',
            style: TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '- api.kawalcorona.com',
          style: TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '- apicovid19indonesia-v2.vercel.app',
          style: TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '- vaksincovid19-api.vercel.app',
          style: TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '- newsapi.org',
          style: TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '- data.covid19.go.id',
          style: TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Text(
            'Saya tidak menjamin ke akuratan dari data yang saya ambil, karena aplikasi ini hanya sebagai tugas saja',
            style: TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
