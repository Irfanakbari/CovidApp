import 'package:appscovid/Home/Statistik/infoapp.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:appscovid/Login/loginpage.dart';
import 'package:appscovid/Services/getdata.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'cardhome.dart';

class HomeScreen2 extends StatefulWidget {
  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  String? email;

  final _tel = 'tel:082276880570';
  final _sms = 'sms:082276880570';
  _telepon() async => await canLaunch(_tel)
      ? await launch(_tel)
      : showTopSnackBar(
          context,
          const CustomSnackBar.error(
            message: "Gagal Membuat Panggilan",
          ),
        );

  _message() async {
    await canLaunch(_sms)
        ? await launch(_sms)
        : showTopSnackBar(
            context,
            const CustomSnackBar.error(
              message: "Gagal Membuat Pesan",
            ),
          );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                AwesomeDialog(
                  context: context,
                  headerAnimationLoop: false,
                  dialogType: DialogType.NO_HEADER,
                  animType: AnimType.SCALE,
                  body: Padding(
                    padding: const EdgeInsets.all(10),
                    child: InfoApp(),
                  ),
                  btnOkOnPress: () {
                    Get.back();
                  },
                ).show();
              },
              icon: const Icon(Icons.info_outline)),
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
          elevation: 0.0,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                onPressed: () {
                  Alert(
                    context: context,
                    type: AlertType.warning,
                    title: "Peringatan",
                    desc: "Apakah Anda Yakin Ingin Logout?",
                    buttons: [
                      DialogButton(
                        child: const Text(
                          "No",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        color: const Color.fromRGBO(0, 179, 134, 1.0),
                      ),
                      DialogButton(
                          child: const Text(
                            "Yes",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            Get.back();
                            Get.off(LoginPage());
                          })
                    ],
                  ).show();
                },
              ),
            )
          ]),
      // drawer: DrawerScreen(),
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Container(
              height: 270,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(33, 150, 243, 1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04,
                    vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FutureBuilder(
                            future: GetData.getEmail(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return const Text(
                                  'Get Data ...',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35),
                                );
                              } else {
                                return Text(
                                  "Hello " + snapshot.data.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Merasakan Gejala Covid-19?',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Flexible(
                            child: Text(
                              'Jika Kamu Merasakan Sakit Gejala Covid-19 Segera Hubungi Layanan Kesehatan Terdekat',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 45,
                            width: 170,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red)),
                                onPressed: () {
                                  _telepon();
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Icon(Icons.call),
                                    Text(
                                      'Call Now',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 45,
                            width: 170,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green)),
                                onPressed: () {
                                  _message();
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Icon(Icons.message),
                                    Text(
                                      'Send SMS',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          CardHome(),
        ],
      ),
    );
  }
}
