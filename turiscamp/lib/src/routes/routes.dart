import 'package:flutter/material.dart';
import 'package:turiscamp/src/pages/city_page/city_page.dart';
import 'package:turiscamp/src/pages/faq_page.dart/faq_page.dart';
import 'package:turiscamp/src/pages/home_page/home_page.dart';
import 'package:turiscamp/src/pages/login_page/login_page.dart';
import 'package:turiscamp/src/pages/notification_page/notification_page.dart';
import 'package:turiscamp/src/pages/recovery_password_page/recovery_password_page.dart';
import 'package:turiscamp/src/pages/register_page/register_page.dart';
import 'package:turiscamp/src/pages/splash_page/splash_page.dart';
import 'package:turiscamp/src/pages/welcome_page/welcome_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    HomePage.routeName: (BuildContext context) => const HomePage(),
    SplashPage.routeName: (BuildContext context) => const SplashPage(),
    RegisterPage.routeName: (BuildContext context) => const RegisterPage(),
    LoginPage.routeName: (BuildContext context) => const LoginPage(),
    RecoveryPasswordPage.routeName: (BuildContext context) =>
        const RecoveryPasswordPage(),
    WelcomePage.routeName: (BuildContext context) => const WelcomePage(),
    NotificationPage.routeName: (BuildContext context) =>
        const NotificationPage(),
    FaqPage.routeName: (BuildContext context) => const FaqPage(),
    CityPage.routeName: (BuildContext context) => const CityPage(),
  };
}
