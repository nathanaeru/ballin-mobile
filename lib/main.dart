import 'package:flutter/material.dart';
import 'package:ballin_mobile/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: "Ballin",
        theme: ThemeData(
          brightness: Brightness.light,
          colorScheme: ColorScheme.light(
            primary: const Color.fromARGB(255, 0, 145, 254),
            secondary: const Color.fromARGB(255, 174, 206, 254),
            surface: const Color.fromARGB(255, 255, 254, 254),
          ),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
