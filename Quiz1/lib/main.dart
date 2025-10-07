// Import statements for Flutter framework components
import 'package:flutter/cupertino.dart'; // Cupertino (iOS-style) widgets
import 'package:flutter/material.dart'; // Material Design widgets
import 'package:google_fonts/google_fonts.dart'; // Google Fonts package for custom typography
import 'gradient_container.dart'; // Custom gradient container widget

/**
 * DICE ROLLER APP - MAIN ENTRY POINT
 * 
 * This is a simple dice rolling application built with Flutter.
 * The app features:
 * - A gradient background container
 * - Interactive dice rolling functionality
 * - Poppins font family for consistent typography
 * - Responsive UI with centered content
 */

/// Entry point of the Flutter application
/// This function is called when the app starts
void main() {
  // Initialize and run the Flutter app
  runApp(
    MaterialApp(
      // App title (shown in task manager/app switcher)
      title: 'Dice Roller App',

      // Configure app-wide theme with Poppins font
      theme: ThemeData(
        // Set Poppins as the default font family for the entire app
        fontFamily: GoogleFonts.poppins().fontFamily,

        // Optional: Configure text themes with Poppins
        textTheme: GoogleFonts.poppinsTextTheme(),

        // Use Material 3 design system
        useMaterial3: true,
      ),

      // Remove debug banner in top-right corner
      debugShowCheckedModeBanner: false,

      // Home screen configuration
      home: const Scaffold(
        // Main app body containing the gradient container with dice roller
        body: GradientContainer([Colors.blue, Colors.amberAccent]),
      ),
    ),
  );
}
