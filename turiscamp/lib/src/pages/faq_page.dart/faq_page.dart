import 'package:flutter/material.dart';
import 'package:turiscamp/src/widgets/header_widget.dart';
import 'package:turiscamp/src/widgets/theme_helper.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  static String routeName = "faq_page";

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final double _headerHeight = 250;
  final Key _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true,
                  Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      const Text(
                        'Welcome',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'We believe in delivering intelligent products you can rely on, making our software the perfect tool to run and accelerate your business with the power of integration and programming. ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    minimumSize: MaterialStateProperty.all(
                                        const Size(50, 50)),
                                    backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 240, 112, 112),
                                    ),
                                    shadowColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        80, 10, 80, 10),
                                    child: Text(
                                      'sign in'.toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Center(
                                child: Text("or"),
                              ),
                              const SizedBox(height: 10.0),
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    minimumSize: MaterialStateProperty.all(
                                        const Size(50, 50)),
                                    backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 25, 36, 60),
                                    ),
                                    shadowColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        80, 10, 80, 10),
                                    child: Text(
                                      'sign up'.toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(height: 15.0),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 30, 10, 20),
                                  //child: Text('Don\'t have an account? Create'),
                                  child: const Text.rich(TextSpan(children: [
                                    TextSpan(text: "Terminos y condiciones"),
                                    TextSpan(
                                      text: '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ])),
                                ),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
