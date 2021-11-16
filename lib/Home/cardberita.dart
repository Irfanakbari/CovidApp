import 'package:appscovid/Services/apiberita.dart';
import 'package:flutter/material.dart';

class BeritaCard extends StatefulWidget {
  @override
  _BeritaCardState createState() => _BeritaCardState();
}

class _BeritaCardState extends State<BeritaCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Berita>(
        future: Berita.connectToAPI(),
        builder: (context, snapshot) {
          for (var i = 0; i < 4; i++) {
            return Card(
              shadowColor: Colors.black,
              color: Colors.white,
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
                    padding: EdgeInsets.all(8),
                    child: SizedBox(
                        height: 100,
                        width: 70,
                        child: snapshot.data!.articles![i].urlToImage == null
                            ? const Center(
                                child: Text('No Image'),
                              )
                            : Image.network(
                                snapshot.data!.articles![i].urlToImage!,
                                width: 200,
                                height: 400,
                                fit: BoxFit.fill,
                              ))),
                onTap: () async {},
              ),
            );
          }
          return Card(
            shadowColor: Colors.black,
            color: Colors.white,
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  snapshot.data!.articles![6].title!,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              subtitle: Text(
                snapshot.data!.articles![6].source!.name!,
                style: const TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
              leading: Padding(
                  padding: EdgeInsets.all(8),
                  child: SizedBox(
                      height: 100,
                      width: 70,
                      child: snapshot.data!.articles![6].urlToImage == null
                          ? const Center(
                              child: Text('No Image'),
                            )
                          : Image.network(
                              snapshot.data!.articles![6].urlToImage!,
                              width: 200,
                              height: 400,
                              fit: BoxFit.fill,
                            ))),
              onTap: () async {},
            ),
          );
        });
  }
}
