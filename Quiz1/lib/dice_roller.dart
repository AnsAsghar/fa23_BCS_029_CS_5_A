// Import statements for core functionality
import 'dart:math'; // Math library for random number generation
import 'package:flutter/cupertino.dart'; // Cupertino widgets
import 'package:flutter/material.dart'; // Material Design widgets
import 'package:google_fonts/google_fonts.dart'; // Google Fonts for Poppins typography

/**
 * DICE ROLLER WIDGET
 * 
 * This widget implements the core dice rolling functionality of the app.
 * Features include:
 * - Random dice roll generation (1-6)
 * - Visual dice representation using asset images
 * - Interactive button to trigger dice rolls
 * - State management for current dice value
 * - Responsive layout with proper spacing
 */

/// Global random number generator instance
/// Used to generate random dice values (1-6)
final randomizer = Random();

/// StatefulWidget for the dice roller component
/// Uses StatefulWidget because the dice value changes over time
class DiceRoller extends StatefulWidget {
  /// Constructor with optional key parameter
  const DiceRoller({super.key});

  /// Creates the mutable state for this widget
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

/// Private state class for DiceRoller widget
/// Manages the current dice value and handles user interactions
class _DiceRollerState extends State<DiceRoller> {
  /// Current dice face value (1-6)
  /// Initialized to 2 as the default starting value
  var currentDiceRoll = 2;

  /// Handles dice roll action when button is pressed
  /// Generates a random number between 1-6 and updates the UI
  void rollDice() {
    // setState triggers a rebuild of the widget with new data
    setState(() {
      // Generate random number: nextInt(6) gives 0-5, +1 makes it 1-6
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
  }

  /// Builds the UI for the dice roller
  /// Returns a vertical layout with dice image and roll button
  @override
  Widget build(context) {
    return Column(
      // Minimize the column size to fit content
      mainAxisSize: MainAxisSize.min,
      children: [
        // Dice image display
        Image.asset(
          // Dynamic asset path based on current dice value
          'assets/images/dice-$currentDiceRoll.png',
          width: 200, // Fixed width for consistent sizing
        ),

        // Spacing between dice and button
        const SizedBox(height: 30),

        // Enhanced roll dice button with attractive background box
        Container(
          // Add decorative background box
          decoration: BoxDecoration(
            // Gradient background for the button
            gradient: const LinearGradient(
              colors: [
                Color(0xFF667eea), // Beautiful blue gradient start
                Color(0xFF764ba2), // Purple gradient end
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),

            // Rounded corners for modern look
            borderRadius: BorderRadius.circular(25),

            // Subtle shadow for depth
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 5), // Shadow position
              ),
            ],
          ),

          // Enhanced button with custom styling
          child: ElevatedButton(
            // Trigger dice roll when pressed
            onPressed: rollDice,

            // Button styling with transparent background to show gradient
            style: ElevatedButton.styleFrom(
              // Transparent background to show container gradient
              backgroundColor: Colors.transparent,

              // Remove default shadow (we have custom shadow)
              shadowColor: Colors.transparent,

              // Rounded corners matching container
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),

              // Generous padding for better touch target
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 18,
              ),

              // Add elevation effect on press
              elevation: 0,
            ),

            // Button content with icon and text
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Dice icon for visual appeal
                const Icon(
                  Icons.casino,
                  color: Colors.white,
                  size: 32,
                ),

                // Spacing between icon and text
                const SizedBox(width: 12),

                // Button text with Poppins font
                Text(
                  'Roll Dice',
                  style: GoogleFonts.poppins(
                    // White text for contrast against gradient
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w700, // Bold for emphasis
                    letterSpacing: 1.2, // Slight letter spacing for elegance
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
