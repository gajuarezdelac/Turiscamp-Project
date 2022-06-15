import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turiscamp/src/bloc/bloc_observer.dart';
import 'package:turiscamp/src/pages/welcome_page/welcome_page.dart';
import 'package:turiscamp/src/providers/bloc_providers.dart';
import 'package:turiscamp/src/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // providers: blocsServices(token == null ? "" : ""),
      providers: blocsServices(""),
      child: MaterialApp(
        title: 'Movie APP',
        debugShowCheckedModeBanner: false,
        initialRoute: WelcomePage.routeName,
        theme: ThemeData(
          fontFamily: 'Comfortaa',
          // appBarTheme: const AppBarTheme(elevation: 0.0),
        ),
        routes: getApplicationRoutes(),
      ),
    );
  }
}
