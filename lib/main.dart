import 'package:flutter/material.dart';
import 'package:login/pantallas/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      routes: {
        'login': (_) => LoginPantalla(),
      },
      initialRoute: 'login',
    );
  }
}

