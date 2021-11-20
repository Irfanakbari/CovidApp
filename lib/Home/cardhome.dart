import 'package:appscovid/Home/cardpencegahan.dart';
import 'package:appscovid/Services/api.dart';
import 'package:appscovid/Services/apiprovinsi.dart';
import 'package:appscovid/Services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';

class CardHome extends StatefulWidget {
  @override
  _CardHomeState createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  Position? _currentPosition;
  Placemark? place;

  final GeolocatorPlatform geolocator = GeolocatorPlatform.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: FutureBuilder<Placemark>(
                  future: LocationServices.getCurrentPosition(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const Card(
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Center(
                            child: Text('Loading Location'),
                          ),
                        ),
                      );
                    } else {
                      return FutureBuilder<Welcome>(
                          future: Welcome.connectToVak(),
                          builder: (context, dataa) {
                            late int array;
                            if (dataa.data == null) {
                              return const Card(
                                elevation: 10,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Center(
                                    child: Text('Loading Location'),
                                  ),
                                ),
                              );
                            }
                            for (var i = 0;
                                i < dataa.data!.listData!.length;
                                i++) {
                              if (dataa.data!.listData![i].key
                                  .toString()
                                  .contains(snapshot.data!.administrativeArea!
                                      .toUpperCase())) {
                                array = i;
                              }
                            }
                            return Card(
                              color: (dataa.data!.listData![array].penambahan
                                          .positif >
                                      9)
                                  ? Colors.yellow
                                  : (dataa.data!.listData![array].penambahan
                                              .positif >
                                          12)
                                      ? Colors.red
                                      : Colors.green,
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.location_pin,
                                          color: Colors.white,
                                        ),
                                        (snapshot.hasData)
                                            ? Text(
                                                // snapshot.data
                                                //         .subAdministrativeArea +
                                                //     ', ' +
                                                snapshot
                                                    .data!.administrativeArea
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : const Text('Get Location..')
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Pencegahan",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ArchivoNarrow'),
              ),
            ],
          ),
          const SizedBox(height: 25),
          const Pencegahan(),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            color: Colors.grey,
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Statistik Global",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ArchivoNarrow'),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      // ignore: prefer_const_constructors
                      icon: Icon(Icons.sync),
                      onPressed: () {
                        setState(() {});
                      })
                ],
              ),
            ],
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
            decoration: BoxDecoration(),
            child: Card(
              shadowColor: Colors.black,
              color: Colors.orange,
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
                  subtitle: FutureBuilder<Global>(
                    future: Global.connectToAPI('positif'),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return const Text('Mengambil Data ...');
                      } else {
                        return Text(
                          snapshot.data!.value! + " Jiwa",
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
            height: 25,
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(),
            child: Card(
              shadowColor: Colors.black,
              color: Colors.lightGreen,
              child: ListTile(
                  contentPadding: const EdgeInsets.all(8),
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
                  subtitle: FutureBuilder<Global>(
                    future: Global.connectToAPI('sembuh'),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return const Text('Mengambil Data ...');
                      } else {
                        return Text(
                          snapshot.data!.value! + " Jiwa",
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
            height: 25,
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(),
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
                  subtitle: FutureBuilder<Global>(
                    future: Global.connectToAPI('meninggal'),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return const Text('Mengambil Data ...');
                      } else {
                        return Text(
                          snapshot.data!.value! + " Jiwa",
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
            height: 40,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: const [
          //     Text(
          //       "Berita Terbaru",
          //       style: TextStyle(
          //           fontSize: 25,
          //           fontWeight: FontWeight.bold,
          //           fontFamily: 'ArchivoNarrow'),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
