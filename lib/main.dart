import 'package:digipaper/responsive/mediaquery.dart';
import 'package:digipaper/ui/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.tiroBangla().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
