import 'package:appscovid/Services/api.dart';
import 'package:appscovid/Services/apiprovinsi.dart';
import 'package:appscovid/Services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: FutureBuilder<dynamic>(
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
                                  .contains(snapshot.data.administrativeArea
                                      .toUpperCase())) {
                                array = i;
                              }
                            }
                            return Card(
                              color: (dataa.data!.listData![array].penambahan
                                          .positif >
                                      9)
                                  ? Colors.yellowAccent
                                  : (dataa.data!.listData![array].penambahan
                                              .positif >
                                          12)
                                      ? Colors.redAccent
                                      : Colors.greenAccent,
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(Icons.location_pin),
                                        (snapshot.hasData)
                                            ? Text(snapshot.data
                                                    .subAdministrativeArea +
                                                ', ' +
                                                snapshot
                                                    .data.administrativeArea)
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  AlertDialog alert = AlertDialog(
                    title: const Text("Jaga Jarak"),
                    content: const Text(
                        "Data yang dimiliki pemerintah, sebaran droplet sejauh 1 meter dan dapat menempel pada benda sekitar. Oleh karenanya mereka yang berjarak kurang dari 1 meter dan memegang benda yang terpapar droplet kemudian tangan yang sudah tersemar menyentuh area wajah, sangat memungkinkan terjadinya penularan."),
                    actions: <Widget>[
                      FlatButton(
                        child: const Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/img/1.png',
                          width: 100,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: const [
                        Text(
                          'Jaga Jarak',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      AlertDialog alert = AlertDialog(
                        title: const Text("Cuci Tangan"),
                        content: const Text(
                            "Cucilah tangan dengan air mengalir dan sabun, setidaknya selama 20 detik. Pastikan seluruh bagian tangan tercuci hingga bersih, termasuk punggung tangan, pergelangan tangan, sela-sela jari, dan kuku.Setelah itu, keringkan tangan menggunakan tisu, handuk bersih, atau mesin pengering tangan."),
                        actions: <Widget>[
                          FlatButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/img/2.png',
                              width: 100,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: const [
                            Text(
                              'Cuci Tangan',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      AlertDialog alert = AlertDialog(
                        title: const Text("Pakai Masker"),
                        content: const Text(
                            "Menggunakan masker pada saat pandemi COVID-19 merupakan hal yang wajib dipakai terutama ketika bepergian keluar rumah. Masker menjadi hal yang esensial karena mampu menangkal virus ataupun bakteri yang akan masuk ke mulut ataupun hidung seseorang."),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/img/3.png',
                              width: 100,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: const [
                            Text(
                              'Pakai Masker',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 40,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: 350,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.orangeAccent.withOpacity(0.7),
                                BlendMode.srcATop),
                            image: const AssetImage('assets/img/positif.png')),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.withOpacity(0.5),
                            spreadRadius: 8,
                            blurRadius: 9,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'KASUS POSITIF',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FutureBuilder<Global>(
                                future: Global.connectToAPI('positif'),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return const CircularProgressIndicator();
                                  } else if (snapshot.hasData) {
                                    return Text(
                                      (snapshot.data!.value.toString()) +
                                          ' Jiwa',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    );
                                  } else {
                                    return const Text(
                                      '0 Jiwa',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: 350,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.lightGreen.withOpacity(0.7),
                                BlendMode.srcATop),
                            image: const AssetImage('assets/img/heart.png')),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.5),
                            spreadRadius: 8,
                            blurRadius: 9,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'SEMBUH',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FutureBuilder<Global>(
                                future: Global.connectToAPI('sembuh'),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return const CircularProgressIndicator();
                                  } else if (snapshot.hasData) {
                                    return Text(
                                      snapshot.data!.value.toString() + ' Jiwa',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    );
                                  } else {
                                    return const Text(
                                      '0 Jiwa',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: 350,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.redAccent.withOpacity(0.7),
                                BlendMode.srcATop),
                            image: const AssetImage('assets/img/death.png')),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.5),
                            spreadRadius: 8,
                            blurRadius: 9,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'MENINGGAL',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FutureBuilder<Global>(
                                    future: Global.connectToAPI('meninggal'),
                                    builder: (context, snapshot) {
                                      if (snapshot.data == null) {
                                        return const CircularProgressIndicator();
                                      } else {
                                        return Text(
                                          snapshot.data!.value.toString() +
                                              ' Jiwa',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
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
