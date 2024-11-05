import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _foodImageAnimation;
  late Animation<Offset> _cubeAnimation;
  late Animation<double> _textFadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _foodImageAnimation = Tween<Offset>(
      begin: Offset(1.5, 0.0),
      end: Offset(0.2, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _cubeAnimation = Tween<Offset>(
      begin: Offset(-1.5, 0.0),
      end: Offset(-0.4, 0.2),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // Animasi fade untuk teks
    _textFadeAnimation = Tween<double>(
      begin: -1.0, // Mulai dengan transparan
      end: 1.0, // Berakhir sepenuhnya tampak
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _controller.forward();

    // Pindah ke halaman berikutnya setelah beberapa detik
    Timer(Duration(seconds: 4), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => NextPage()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF165F4B),
      body: Stack(
        children: [
          Center(
            child: SlideTransition(
              position: _foodImageAnimation,
              child: Image.asset(
                'assets/2.png',
                width: 753.0,
                height: 800.0,
              ),
            ),
          ),
          Center(
            child: SlideTransition(
              position: _cubeAnimation,
              child: Image.asset(
                'assets/1.png',
                width: 479.0,
                height: 538.0,
              ),
            ),
          ),
          Positioned(
            left: 30,
            top: MediaQuery.of(context).size.height / 2 -
                50, // Centering vertikal teks
            child: FadeTransition(
              opacity: _textFadeAnimation, // Menambahkan animasi fade
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FitBite',
                    style: GoogleFonts.montserrat(
                      fontSize: 64,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Halaman Berikutnya"),
      ),
    );
  }
}
