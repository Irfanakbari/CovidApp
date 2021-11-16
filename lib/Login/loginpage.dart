import 'package:appscovid/Auth/login.dart';
import 'package:appscovid/Home/mainhome.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:appscovid/Login/registerPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Center(
              child: Text.rich(
                TextSpan(
                  text: 'LOGIN',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Color.fromRGBO(144, 238, 144, 1)),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
                child: Image.asset(
              'assets/img/bg.jpeg',
              width: 190,
            )),
            const SizedBox(height: 30),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _email,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Email'),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Password'),
            ),
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 400,
                height: 50,
                // ignore: deprecated_member_use
                child: RaisedButton(
                    textColor: Colors.white,
                    color: const Color.fromRGBO(144, 238, 144, 1),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () async {
                      await (CekLogin.cekLogin(_email.text, _password.text))
                          .then((value) {
                        if (value == 2) {
                          AwesomeDialog(
                            context: context,
                            headerAnimationLoop: false,
                            dialogType: DialogType.NO_HEADER,
                            desc: 'Login Berhasil',
                            btnOkOnPress: () {
                              Get.back();
                              Get.off(Home());
                            },
                            btnOkIcon: Icons.check_circle,
                          ).show();
                        } else if (value == 1) {
                          showTopSnackBar(
                            context,
                            const CustomSnackBar.error(
                              message: "Format Email Salah",
                            ),
                          );
                        } else {
                          showTopSnackBar(
                            context,
                            const CustomSnackBar.error(
                              message: "Email atau Password Salah",
                            ),
                          );
                        }
                      });
                    }),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  children: const [
                    Text(
                      'Does not have account?',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(RegisterPage());
                        },
                        child: const Text('Register',
                            style: TextStyle(
                                color: Color.fromRGBO(84, 197, 248, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
