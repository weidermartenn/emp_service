import 'package:flutter/material.dart';
import 'pages/Main/main_app.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const MainApp(),
    //'/authorize': (context) => const AuthPage(),
    //'/registry': (context) => const RegPage(),
  },
));

