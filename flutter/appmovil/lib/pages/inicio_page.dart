import 'package:flutter/material.dart';
import 'sliderpage.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Inicio.jpg'), 
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80.0, //aumenta el radio para agrandar el logo
                backgroundColor: Colors.white,
                child: Image.asset('assets/logoApp.png'), 
              ),
              SizedBox(height: 48.0), // Espacio entre el logo y el texto de bienvenida.
              Text(
                '¡Te damos la bienvenida!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24.0), // Espacio entre el texto de bienvenida y el botón de inicio.
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SliderPage()),
                  );                 
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.vpn_key, color: Colors.white),
                    SizedBox(width: 8.0),
                    Text(
                      'Inicio',
                      style: TextStyle(color:Colors.white),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF75AD1B), // Color del botón.
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0), // Padding del botón.
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
