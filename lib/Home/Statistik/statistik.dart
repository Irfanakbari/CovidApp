import 'package:appscovid/Home/Statistik/statindo.dart';
import 'package:appscovid/Services/api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Stat extends StatefulWidget {
  @override
  _StatState createState() => _StatState();
}

class _StatState extends State<Stat> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(vsync: this, length: 3);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        "Indonesia",
                        style: TextStyle(
                            color: Color.fromRGBO(71, 63, 151, 1),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 12,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 7.0,
                        spreadRadius: 0.0,
                      )
                    ]),
                    child: Card(
                      shadowColor: Colors.black,
                      color: Colors.deepOrange,
                      child: ListTile(
                          contentPadding: EdgeInsets.all(8),
                          title: const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Kasus Positif',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ),
                          subtitle: FutureBuilder<Lokal>(
                            future: Lokal.connectToAPI(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return const Text('Mengambil Data ...');
                              } else {
                                return Text(
                                  NumberFormat('###,###,###')
                                          .format(snapshot.data!.positif) +
                                      " Jiwa",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                );
                              }
                            },
                          ),
                          trailing: Image.asset('assets/img/positif.png')),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 7.0,
                        spreadRadius: 0.0,
                      )
                    ]),
                    child: Card(
                      shadowColor: Colors.black,
                      color: Colors.blue,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(8),
                        title: const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Sedang Dirawat',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                        subtitle: FutureBuilder<Lokal>(
                          future: Lokal.connectToAPI(),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return const Text('Mengambil Data ...');
                            } else {
                              return Text(
                                NumberFormat('###,###,###')
                                        .format(snapshot.data!.dirawat) +
                                    " Jiwa",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18),
                              );
                            }
                          },
                        ),
                        trailing: Image.asset('assets/img/dirawat.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 7.0,
                        spreadRadius: 0.0,
                      )
                    ]),
                    child: Card(
                      shadowColor: Colors.black,
                      color: Colors.lightGreen,
                      child: ListTile(
                          contentPadding: EdgeInsets.all(8),
                          title: const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Kasus Sembuh',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ),
                          subtitle: FutureBuilder<Lokal>(
                            future: Lokal.connectToAPI(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return const Text('Mengambil Data ...');
                              } else {
                                return Text(
                                  NumberFormat('###,###,###')
                                          .format(snapshot.data!.sembuh) +
                                      " Jiwa",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                );
                              }
                            },
                          ),
                          trailing: Image.asset('assets/img/heart.png')),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 7.0,
                        spreadRadius: 0.0,
                      )
                    ]),
                    child: Card(
                      shadowColor: Colors.black,
                      color: Colors.red,
                      child: ListTile(
                          contentPadding: EdgeInsets.all(8),
                          title: const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Kasus Meninggal',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ),
                          subtitle: FutureBuilder<Lokal>(
                            future: Lokal.connectToAPI(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return const Text('Mengambil Data ...');
                              } else {
                                return Text(
                                  NumberFormat('###,###,###')
                                          .format(snapshot.data!.meninggal) +
                                      " Jiwa",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                );
                              }
                            },
                          ),
                          trailing: Image.asset('assets/img/death.png')),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: const [
                      Text(
                        "Data Vaksinasi Indonesia",
                        style: TextStyle(
                            color: Color.fromRGBO(71, 63, 151, 1),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 12,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 7.0,
                        spreadRadius: 0.0,
                      )
                    ]),
                    child: Card(
                      shadowColor: Colors.black,
                      color: Colors.pink,
                      child: ListTile(
                          contentPadding: EdgeInsets.all(8),
                          title: const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Target Vaksinasi',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ),
                          subtitle: FutureBuilder<Vaksin>(
                            future: Vaksin.connectToVak(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return const Text('Mengambil Data ...');
                              } else {
                                return Text(
                                  NumberFormat('###,###,###')
                                          .format(snapshot.data!.totalsasaran) +
                                      " Jiwa",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                );
                              }
                            },
                          ),
                          trailing: Image.asset('assets/img/target.png')),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 7.0,
                        spreadRadius: 0.0,
                      )
                    ]),
                    child: Card(
                      shadowColor: Colors.black,
                      color: Colors.blue,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(8),
                        title: const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Tenaga Kesehatan',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                        subtitle: FutureBuilder<Vaksin>(
                          future: Vaksin.connectToVak(),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return const Text('Mengambil Data ...');
                            } else {
                              return Text(
                                NumberFormat('###,###,###')
                                        .format(snapshot.data!.dokter) +
                                    " Jiwa",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18),
                              );
                            }
                          },
                        ),
                        trailing: Image.asset('assets/img/medis.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 7.0,
                        spreadRadius: 0.0,
                      )
                    ]),
                    child: Card(
                      shadowColor: Colors.black,
                      color: Colors.lightGreen,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(8),
                        title: const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Orang Tua / Lansia',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                        subtitle: FutureBuilder<Vaksin>(
                          future: Vaksin.connectToVak(),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return Text('Mengambil Data ...');
                            } else {
                              return Text(
                                NumberFormat('###,###,###')
                                        .format(snapshot.data!.lansia) +
                                    " Jiwa",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18),
                              );
                            }
                          },
                        ),
                        trailing: Image.asset('assets/img/lansia.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 7.0,
                        spreadRadius: 0.0,
                      )
                    ]),
                    child: Card(
                      shadowColor: Colors.black,
                      color: Colors.red,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(8),
                        title: const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Petugas Publik',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                        subtitle: FutureBuilder<Vaksin>(
                          future: Vaksin.connectToVak(),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return const Text('Mengambil Data ...');
                            } else {
                              return Text(
                                NumberFormat('###,###,###')
                                        .format(snapshot.data!.publik) +
                                    " Jiwa",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18),
                              );
                            }
                          },
                        ),
                        trailing: Image.asset('assets/img/publik.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 7.0,
                        spreadRadius: 0.0,
                      )
                    ]),
                    child: Card(
                      shadowColor: Colors.black,
                      color: Colors.purple,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(8),
                        title: const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Vaksinasi Tahap Pertama',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                        subtitle: FutureBuilder<Vaksin>(
                          future: Vaksin.connectToVak(),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return const Text('Mengambil Data ...');
                            } else {
                              return Text(
                                NumberFormat('###,###,###')
                                        .format(snapshot.data!.vaksin1) +
                                    " Jiwa",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18),
                              );
                            }
                          },
                        ),
                        trailing: Image.asset('assets/img/vaksin.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 7.0,
                        spreadRadius: 0.0,
                      )
                    ]),
                    child: Card(
                      shadowColor: Colors.black,
                      color: Colors.brown,
                      child: ListTile(
                          contentPadding: EdgeInsets.all(8),
                          title: const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Vaksinasi Tahap Kedua',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ),
                          subtitle: FutureBuilder<Vaksin>(
                            future: Vaksin.connectToVak(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return const Text('Mengambil Data ...');
                              } else {
                                return Text(
                                  NumberFormat('###,###,###')
                                          .format(snapshot.data!.vaksin2) +
                                      " Jiwa",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                );
                              }
                            },
                          ),
                          trailing: Image.asset('assets/img/vaksin.png')),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
