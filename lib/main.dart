import 'package:flutter/material.dart';
import 'pages/Main/main_app.dart';
import 'pages/Auth/auth_page.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const MainApp(),
    '/authorize': (context) => const AuthPage(),
    //'/registry': (context) => const RegPage(),
  },
));

