import 'package:flutter/material.dart';
import 'package:quiz_tpm/pages/beranda_page.dart';
import 'package:quiz_tpm/pages/cube_page.dart';
import 'package:quiz_tpm/pages/trapesium_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '123210102-Quiz-TPM-IF-E',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
          useMaterial3: true
      ),
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(
          user: ModalRoute.of(context)!.settings.arguments as String,
          pass: '',
        ),
        '/trapesium': (context) => TrapesiumPage(),
        '/cube': (context) => CubePage(),
        '/dayCalculated': (context) => DayCalculatorPage(
          selectedDay: ModalRoute.of(context)!.settings.arguments as int,
        ),
      },
    );
  }
}
