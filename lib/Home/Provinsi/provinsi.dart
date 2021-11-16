import 'package:appscovid/Services/apiprovinsi.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        backgroundColor: const Color.fromRGBO(71, 63, 151, 1),
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
        padding: const EdgeInsets.all(10),
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
                return ListView.builder(
                    itemCount: snapshot.data!.listData!.length,
                    itemBuilder: (context, i) {
                      return SizedBox(
                        height: 170,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(30), // if you need this
                              side: BorderSide(
                                color: Colors.green.withOpacity(0.8),
                                width: 1,
                              )),
                          shadowColor: Colors.green,
                          color: Colors.green,
                          child: ListTile(
                              contentPadding: EdgeInsets.all(8),
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  snapshot.data!.listData![i].key,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20,
                                      fontFamily: 'Pattaya',
                                      letterSpacing: 2),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Positif : ' +
                                            NumberFormat('###,###,###').format(
                                                snapshot.data!.listData![i]
                                                    .jumlahKasus) +
                                            " Jiwa",
                                        style: const TextStyle(
                                            color: Colors.yellow,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                            fontFamily: 'Graphik'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Dirawat : ' +
                                            NumberFormat('###,###,###').format(
                                                snapshot.data!.listData![i]
                                                    .jumlahDirawat) +
                                            " Jiwa",
                                        style: const TextStyle(
                                            color: Colors.yellow,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                            fontFamily: 'Graphik'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Sembuh : ' +
                                            NumberFormat('###,###,###').format(
                                                snapshot.data!.listData![i]
                                                    .jumlahDirawat) +
                                            " Jiwa",
                                        style: const TextStyle(
                                            color: Colors.yellow,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                            fontFamily: 'Graphik'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Meninggal : ' +
                                            NumberFormat('###,###,###').format(
                                                snapshot.data!.listData![i]
                                                    .jumlahMeninggal) +
                                            " Jiwa",
                                        style: const TextStyle(
                                            color: Colors.yellow,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: Image.asset('assets/img/lokasi.png')),
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }
}
