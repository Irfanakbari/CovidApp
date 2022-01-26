// ignore_for_file: file_names

import 'package:appscovid/Auth/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'loginpage.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _username = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();
    _username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              const Center(
                child: Text.rich(
                  TextSpan(
                    text: 'REGISTER',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Color.fromRGBO(144, 238, 144, 1)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Image.asset(
                'assets/img/bg.jpeg',
                width: 190,
              )),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: _username,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Username'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _email,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Email'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Password'),
              ),
              const SizedBox(height: 10),
              FlutterPwValidator(
                controller: _password,
                minLength: 6,
                uppercaseCharCount: 1,
                width: 400,
                height: 100,
                onSuccess: () {
                  print('Password Oke');
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: 400,
                  height: 50,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                      textColor: Colors.white,
                      color: const Color.fromRGBO(144, 238, 144, 1),
                      child: const Text(
                        'Daftar Akun',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () async {
                        await Register.saveData(
                                _email.text, _password.text, _username.text)
                            .then((value) {
                          if (value == 2) {
                            showTopSnackBar(
                                context,
                                const CustomSnackBar.success(
                                  message:
                                      "Registrasi Berhasil, Silahkan Login",
                                ));
                            Get.off(LoginPage());
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
                                message: "Data Tidak Boleh Kosong",
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
                        'Does have account?',
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
                            Get.off(LoginPage());
                          },
                          child: const Text('Login',
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
      ),
    );
  }
}
