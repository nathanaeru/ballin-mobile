import 'package:flutter/material.dart';
import 'package:ballin_mobile/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: const Color.fromARGB(255, 132, 0, 255),
          secondary: const Color.fromARGB(255, 152, 94, 219),
          surface: const Color.fromARGB(255, 30, 0, 78),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
