import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slider Demo',
      home: SliderPage(),
    );
  }
}

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  int _currentPage = 0;
  final PageController _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: isCurrentPage ? 12.0 : 8.0,
      width: isCurrentPage ? 12.0 : 8.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.green : Colors.grey[300],
        borderRadius: BorderRadius.circular(6.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _controller,
            onPageChanged: (int page) {
              setState(() => _currentPage = page);
            },
            children: <Widget>[
              Slide(imagePath: 'assets/slide1.jpg', title: 'Explora', subtitle: 'Frutas, verduras y más'),
              Slide(imagePath: 'assets/slide2.jpg', title: 'Elige', subtitle: 'Los mejores productos'),
              Slide(imagePath: 'assets/slide3.jpg', title: 'Prefiere', subtitle: 'Comida sana, entrega rápida, sonrisa segura'),
            ],
          ),
          Positioned(
            left: 20.0,
            bottom: 20.0,
            child: TextButton(
              onPressed: () {
                // Funcionalidad para el botón "Omitir"
              },
              child: Text('Omitir', style: TextStyle(color: Colors.white)),
            ),
          ),
          Positioned(
            right: 20.0,
            bottom: 20.0,
            child: TextButton(
              onPressed: () {
                // Funcionalidad para el botón "Siguiente"
                if (_currentPage < 2) {
                  _controller.animateToPage(
                    _currentPage + 1,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text('Siguiente', style: TextStyle(color: Colors.white)),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                3,
                (index) => _buildPageIndicator(index == _currentPage),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class Slide extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const Slide({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Grey circle background
          Container(
            height: 140.0,
            width: 140.0,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  // Remove background color from here if you are using a circle
                ),
              ),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  // Remove background color from here if you are using a circle
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
