import 'package:appscovid/Services/listrs.dart';
import 'package:appscovid/Services/location.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListRs extends StatefulWidget {
  @override
  _ListRsState createState() => _ListRsState();
}

class _ListRsState extends State<ListRs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
        toolbarHeight: 60,
        title: const Text('Rumah Sakit Rujukan Covid-19'),
        actions: [IconButton(icon: Icon(Icons.sync), onPressed: () {})],
      ),
      body: FutureBuilder<dynamic>(
          future: LocationServices.getCurrentPosition(),
          builder: (context, lokasi) {
            return FutureBuilder<dynamic>(
                future: ListRS.connectToAPI(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("LOADING DATA"),
                          ],
                        ),
                      ],
                    ));
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, i) {
                          if (snapshot.data[i].province
                              .toString()
                              .contains(lokasi.data.administrativeArea)) {
                            return InkWell(
                              onTap: () {
                                launch(snapshot.data[i].url);
                              },
                              child: Card(
                                shadowColor: Colors.blue,
                                color: Colors.blue[50],
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(8),
                                  title: Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text(
                                      snapshot.data[i].name,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  subtitle: Text(snapshot.data[i].region,
                                      style: const TextStyle(fontSize: 12)),
                                  trailing: Text(
                                    snapshot.data[i].province,
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            );
                          }

                          return Container();
                        });
                  }
                });
          }),
    );
  }
}
