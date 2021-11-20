import 'package:appscovid/Services/apiprovinsi.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:accordion/accordion.dart';

class Provinsi extends StatefulWidget {
  @override
  _ProvinsiState createState() => _ProvinsiState();
}

class _ProvinsiState extends State<Provinsi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
        toolbarHeight: 60,
        title: const Text('Statistik Per Provinsi'),
        actions: [
          IconButton(
              icon: const Icon(Icons.sync),
              onPressed: () {
                setState(() {});
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(1),
        child: FutureBuilder<Welcome>(
            future: Welcome.connectToVak(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "LOADING DATA",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ));
              } else {
                return Accordion(
                    maxOpenSections: 1,
                    headerBorderRadius: 2,
                    headerBackgroundColor: Colors.blue[200],
                    headerPadding: const EdgeInsets.all(15),
                    children: [
                      for (var i = 0; i < snapshot.data!.listData!.length; i++)
                        AccordionSection(
                          isOpen: false,
                          header: Text(snapshot.data!.listData![i].key,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 17)),
                          content: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'Kasus : ' +
                                          NumberFormat('###,###,###').format(
                                              snapshot.data!.listData![i]
                                                  .jumlahKasus),
                                      style: const TextStyle(
                                          color: Colors.orangeAccent,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    'Sembuh : ' +
                                        NumberFormat('###,###,###').format(
                                            snapshot.data!.listData![i]
                                                .jumlahSembuh),
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      'Meninggal : ' +
                                          NumberFormat('###,###,###').format(
                                              snapshot.data!.listData![i]
                                                  .jumlahMeninggal),
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 25, bottom: 10),
                                    child: SizedBox(
                                      child: Text(
                                        'Jenis Kelamin : ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                      'Laki-Laki : ' +
                                          NumberFormat('###,###,###').format(
                                              snapshot.data!.listData![i]
                                                  .jenisKelamin![0].docCount),
                                      style: const TextStyle()),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.07,
                                  ),
                                  Text(
                                    'Perempuan : ' +
                                        NumberFormat('###,###,###').format(
                                            snapshot.data!.listData![i]
                                                .jenisKelamin![1].docCount),
                                    style: const TextStyle(),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 15, bottom: 10),
                                    child: SizedBox(
                                      child: Text(
                                        'Kelompok Usia : ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      for (var j = 0;
                                          j <
                                              snapshot.data!.listData![i]
                                                  .kelompokUmur!.length;
                                          j++)
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 80,
                                              child: Text(
                                                  'Usia ' +
                                                      snapshot
                                                          .data!
                                                          .listData![i]
                                                          .kelompokUmur![j]
                                                          .key,
                                                  style: const TextStyle()),
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Text(' :  ' +
                                                NumberFormat('###,###,###')
                                                    .format(snapshot
                                                        .data!
                                                        .listData![i]
                                                        .kelompokUmur![j]
                                                        .docCount))
                                          ],
                                        ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.07,
                                      ),
                                      // Text(
                                      //   'Perempuan : ' +
                                      //       NumberFormat('###,###,###').format(
                                      //           snapshot.data!.listData![i]
                                      //               .jenisKelamin![1].docCount),
                                      //   style: const TextStyle(),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      //
                    ]);
              }
            }),
      ),
    );
  }
}
