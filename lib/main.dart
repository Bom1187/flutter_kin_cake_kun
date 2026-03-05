import 'package:flutter/material.dart';
import 'package:flutter_kin_cake_kun/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(FlutterKinCakeKun());
}

class FlutterKinCakeKun extends StatefulWidget {
  const FlutterKinCakeKun({super.key});

  @override
  State<FlutterKinCakeKun> createState() => _FlutterKinCakeKunState();
}

class _FlutterKinCakeKunState extends State<FlutterKinCakeKun> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        )
      ),
    );
  }
}