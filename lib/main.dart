import 'package:flutter/material.dart';
import 'package:flutter_auth/view/screens/home_screen.dart';
import 'package:flutter_auth/view/screens/login_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,

      ),
      home: const HomeScreen(),
    );
  }
}
