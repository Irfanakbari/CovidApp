import 'package:appscovid/Services/apiberita.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BeritaPage extends StatefulWidget {
  @override
  _BeritaPageState createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(33, 150, 243, 0.7),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
        toolbarHeight: 60,
        title: const Text('Berita Kesehatan Terbaru'),
        actions: [
          IconButton(
              icon: Icon(Icons.sync),
              onPressed: () {
                setState(() {});
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<Berita>(
            future: Berita.connectToAPI(),
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
                    itemCount: snapshot.data!.articles!.length,
                    itemBuilder: (context, i) {
                      return Card(
                        shadowColor: Colors.black,
                        color: Colors.white.withOpacity(0.8),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8),
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              snapshot.data!.articles![i].title!,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                          subtitle: Text(
                            snapshot.data!.articles![i].source!.name!,
                            style: const TextStyle(fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                          leading: Padding(
                              padding: const EdgeInsets.all(8),
                              child: SizedBox(
                                  height: 100,
                                  width: 70,
                                  child:
                                      snapshot.data!.articles![i].urlToImage ==
                                              null
                                          ? const Center(
                                              child: Text('No Image'),
                                            )
                                          : Image.network(
                                              snapshot.data!.articles![i]
                                                  .urlToImage!,
                                              width: 200,
                                              height: 400,
                                              fit: BoxFit.fill,
                                            ))),
                          onTap: () async {
                            await launch(snapshot.data!.articles![i].url!);
                          },
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }
}
