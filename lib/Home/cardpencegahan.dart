import 'package:flutter/material.dart';

class Pencegahan extends StatelessWidget {
  const Pencegahan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: [
            GestureDetector(
              onTap: () {
                AlertDialog alert = AlertDialog(
                  content: const Text(
                      "Sering suci tangan pakai sabun dan air mengalir (minimal selama 20 detik). Gunakan *hand sanitizer* (minimal mengandung alkohol 60%), dan gosokan pada tangan sampai terasa kering sebagai pengganti air dan sabun"),
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
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    AlertDialog alert = AlertDialog(
                      content: const Text(
                          "Hindari menyentuh muka, hidung dan mata sebelum mencuci tangan. Jauhi orang yang menunjukkan gejala (demam, batuk kering, kelelahan). Jaga jarak minimal 1 meter dengan orang lain."),
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
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    AlertDialog alert = AlertDialog(
                      content: const Text(
                          "Bila Anda mengalami demam, rasa lelah dan batuk kering, segera cari pengobatan."),
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
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    AlertDialog alert = AlertDialog(
                      content: const Text(
                          "Anda dapat menguatkan sistem kekebalan diri dengan melakukan perilaku sehat, seperti olah raga teratur, makan makanan bergizi seimbang, tidak merokok dan memastikan Anda dan anak Anda mendapat imunisasi lengkap."),
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
                            'assets/img/4.png',
                            width: 100,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    AlertDialog alert = AlertDialog(
                      content: const Text(
                          "Gunakan masker hanya ketika Anda sakit atau batuk dan bersin demi melindungi orang lain."),
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
                            'assets/img/5.png',
                            width: 100,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    AlertDialog alert = AlertDialog(
                      content: const Text(
                          "Saat batuk atau bersin, tutupi mulut dan hidung dengan siku terlipat atau tisu, yang langsung dibuang ke tempat sampah tertutp setelah digunakan."),
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
                            'assets/img/6.png',
                            width: 100,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    AlertDialog alert = AlertDialog(
                      content: const Text(
                          "Bagi seserorang yang merencanakan perjalanan dihimbau menyiapkan perlengkapan cairan pembersih tangan, tisu pembersih/ pengering dan tisu atau lap disinfektan."),
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
                            'assets/img/7.png',
                            width: 100,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
          ]),
    );
  }
}
