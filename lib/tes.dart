import 'package:appscovid/Services/apiprovinsi.dart';
import 'package:flutter/material.dart';

class Tes extends StatefulWidget {
  @override
  _TesState createState() => _TesState();
}

class _TesState extends State<Tes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder<Welcome>(
          future: Welcome.connectToVak(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Text('dddd');
            } else {
              for (var i = 0; i < snapshot.data!.listData!.length; i++) {
                if (snapshot.data!.listData![i].key
                    .toString()
                    .contains('YOGYAKARTA')) {
                  if (snapshot.data!.listData![i].penambahan.positif > 10) {
                    return Text('yaya');
                  }
                }
              }
              return Text('yddd');
            }
          }),
    ));
  }
}
