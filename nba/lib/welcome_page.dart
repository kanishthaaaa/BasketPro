import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nba/home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Image.asset(
                'lib/images/NBA.png',
                height: 300,
                width: 400,
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'BasketPro.',
                    style: GoogleFonts.poppins(
                        fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'A one-stop destindation for all NBA enthusiats.',
                style: GoogleFonts.poppins(
                  fontSize: 23,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(12)),
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      'Let\'s Go',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
