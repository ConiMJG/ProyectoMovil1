import 'package:flutter/material.dart';
import 'dart:async';
import 'inicio_page.dart';


class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key); 

  @override
  _IntroPageState createState() => _IntroPageState();
}  

class _IntroPageState extends State<IntroPage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => InicioPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6ACE17),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/logoApp.png'),
            ),
          ],
        ),
      ),
    );
  }
}
