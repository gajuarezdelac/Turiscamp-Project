import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turiscamp/src/bloc/auth/register/register_bloc.dart';
import 'package:turiscamp/src/bloc/auth/register/register_state.dart';
import 'package:turiscamp/src/models/params/user_register_params.dart';
import 'package:turiscamp/src/pages/login_page/login_page.dart';
import 'package:turiscamp/src/utils/dialogs.dart';
import 'package:turiscamp/src/widgets/header_widget.dart';
import 'package:turiscamp/src/widgets/theme_helper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static String routeName = "register_page";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBloc? _registerBloc;

  final double _headerHeight = 250;
  final _formKey = GlobalKey<FormState>();

  TextEditingController phoneNumberText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    phoneNumberText.dispose();
    passwordText.dispose();
    emailText.dispose();
    super.dispose();
  }

  void initialData() async {
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
  }

  @override
  void initState() {
    initialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();

            if (state is IsLoadingRegister) {
              ProgressDialog.show(context);
            } else if (state is SuccessRegister) {
              ProgressDialog.dissmiss(context);
              // snackbarRoundInfo(context, "Registrado correctamente",
              //     const Color.fromARGB(255, 49, 193, 17));
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            }
            if (state is ErrorRegister) {
              ProgressDialog.dissmiss(context);
              // snackbarRoundInfo(context, "${state.messageError}", Colors.red);
            }
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: _headerHeight,
                      child: HeaderWidget(
                          _headerHeight,
                          true,
                          Icons
                              .login_rounded), //let's create a common header widget
                    ),
                    SafeArea(
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          margin: const EdgeInsets.fromLTRB(
                              20, 10, 20, 10), // This will be the login form
                          child: Column(
                            children: [
                              const Text(
                                'Sign up',
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10.0),
                              const Text(
                                'Fill in the fields and register',
                                style: TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 20.0),
                              Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: TextFormField(
                                          controller: phoneNumberText,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Enter your phone number';
                                            }
                                            return null;
                                          },
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[0-9]')),
                                          ],
                                          decoration: ThemeHelper()
                                              .textInputDecoration(
                                                  Icons.phone,
                                                  'Phone number',
                                                  'Enter your phone number'),
                                        ),
                                        decoration: ThemeHelper()
                                            .inputBoxDecorationShaddow(),
                                      ),
                                      const SizedBox(height: 30.0),
                                      Container(
                                        child: TextFormField(
                                          controller: emailText,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Enter your email';
                                            }
                                            return null;
                                          },
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: ThemeHelper()
                                              .textInputDecoration(
                                                  Icons.email_outlined,
                                                  'Email',
                                                  'Enter your email'),
                                        ),
                                        decoration: ThemeHelper()
                                            .inputBoxDecorationShaddow(),
                                      ),
                                      const SizedBox(height: 30.0),
                                      Container(
                                        child: TextFormField(
                                          controller: passwordText,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Enter your password';
                                            }
                                            return null;
                                          },
                                          obscureText: true,
                                          decoration: ThemeHelper()
                                              .textInputDecoration(
                                                  Icons.password,
                                                  'Password',
                                                  'Enter your password'),
                                        ),
                                        decoration: ThemeHelper()
                                            .inputBoxDecorationShaddow(),
                                      ),
                                      const SizedBox(height: 25.0),
                                      Container(
                                        decoration: ThemeHelper()
                                            .buttonBoxDecoration(context),
                                        child: ElevatedButton(
                                          style: ThemeHelper().buttonStyle(),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                40, 10, 40, 10),
                                            child: Text(
                                              'Sign up'.toUpperCase(),
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          onPressed: () async {
                                            onSubmit(context);
                                          },
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacementNamed(
                                              context, LoginPage.routeName);
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              10, 30, 10, 20),
                                          //child: Text('Don\'t have an account? Create'),
                                          child: const Text.rich(
                                              TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "Do you have an account?"),
                                            TextSpan(
                                              text: ' Log In',
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
          },
        ));
  }

  void onSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
      final regExp = RegExp(pattern);
      bool validate = true;

      if (!regExp.hasMatch(emailText.text.trim())) {
        // snackbarRoundInfo(context, "No es un email valido!",
        //     Color.fromARGB(255, 235, 132, 7));
        validate = false;
      }

      UserRegisterParams params = UserRegisterParams(
        username: phoneNumberText.text.trim(),
        password: passwordText.text,
        email: emailText.text.trim(),
      );

      if (validate) {
        // _registerBloc?.add(EventRegister(params: params));
        // Navigator.pushReplacementNamed(context, ValidateAccount.routeName);
      }
    }
  }
}
