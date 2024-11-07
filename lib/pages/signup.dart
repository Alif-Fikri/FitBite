import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:fitbite/pages/login.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6C8776),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  // Logika untuk tombol kembali
                },
              ),
            ),
            Text(
              'FitBite',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 48.0,
                fontWeight: FontWeight.w400,
                color: Color(0xFF165F4B),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 75.0),
                child: Text(
                  'Login to your Account',
                  style: GoogleFonts.montserrat(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 69.0,
              width: 322.0,
              child: TextField(
                style: GoogleFonts.montserrat(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Username',
                  hintStyle: GoogleFonts.montserrat(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFF165F4B)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Color(0xFF165F4B), width: 2.5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 69.0,
              width: 322.0,
              child: TextField(
                obscureText: true,
                style: GoogleFonts.montserrat(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: GoogleFonts.montserrat(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFF165F4B)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Color(0xFF165F4B), width: 2.5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 322.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  // Logika untuk tombol Sign In
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF165F4B),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Sign in',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: 'Don’t have an Account? ',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Sign Up',
                      style: GoogleFonts.montserrat(
                          color: Color(0xFF165F4B),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage()));
                        }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
