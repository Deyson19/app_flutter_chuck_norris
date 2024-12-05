import 'package:chuck_norris/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chuck Norris - App',
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(
            'Chuck Norris Jokes',
            style: GoogleFonts.angkor(
              fontSize: 20,
              color:Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),
            centerTitle:true,
        ),
        body: const HomeScreen(),
      ),
    );
  }
}
