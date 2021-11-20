// ignore_for_file: file_names

import 'package:appscovid/Home/Berita/berita.dart';
import 'package:appscovid/Home/Provinsi/provinsi.dart';
import 'package:appscovid/Home/Rs/listrs.dart';
import 'package:appscovid/Home/Statistik/statistik.dart';
import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int navIndex = 0;
  void selectNavBot(int index) {
    setState(() {
      navIndex = index;
    });
  }

  final List<Widget> tab = [
    HomeScreen2(),
    Stat(),
    Provinsi(),
    ListRs(),
    BeritaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('Tekan sekali lagi untuk keluar'),
          ),
          child: tab[navIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey.shade700,
        selectedItemColor: const Color.fromRGBO(33, 150, 243, 1),
        currentIndex: navIndex,
        onTap: selectNavBot,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: 'Nasional'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Provinsi'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital), label: 'Hospital'),
          BottomNavigationBarItem(
              icon: Icon(Icons.my_library_books), label: 'Berita'),
        ],
      ),
    );
  }
}
