import 'package:flutter/material.dart';
import 'package:project/learn_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class home_page extends StatelessWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(200),
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return learnFlutter();
              },
            ),
          );
        },
        child: Text(
          "Learn Flutter",
          style: GoogleFonts.robotoMono(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
