import 'package:flutter/material.dart';
import 'package:appmovi/pages/intro_page.dart'; 
import 'package:appmovi/pages/Inicio_page.dart'; 

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orgánicos Ya!',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: const IntroPage(),  
    );
  }
}
