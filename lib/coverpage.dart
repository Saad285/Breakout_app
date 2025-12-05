import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_pt1/bottomNavigation.dart';
import 'package:provider_pt1/shoppage.dart';

class CoverPage extends StatelessWidget {
  final String imagee;
  final Color color;
  final int indicator;
  const CoverPage({
    super.key,
    required this.imagee,
    required this.color,
    required this.indicator,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagee,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Positioned.fill(
          top: 18,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Upto 50% off",
                style: GoogleFonts.tiltPrism(
                  textStyle: TextStyle(
                    fontSize: 38,
                    color: color,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BottomNavigation(indicator: indicator),
                    ),
                  );
                },
                child: Text(
                  "SHOP",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
