// Import statements for Flutter framework and Google Fonts
import 'package:flutter/cupertino.dart'; // Cupertino widgets
import 'package:flutter/material.dart'; // Material Design widgets
import 'package:google_fonts/google_fonts.dart'; // Google Fonts for Poppins typography

/**
 * REUSABLE TEXT WIDGET
 * 
 * This widget provides a consistent text component with custom styling
 * throughout the dice roller app.
 * 
 * Features:
 * - Customizable text content
 * - Consistent Poppins font family
 * - White text color for contrast against gradient background
 * - Large font size for good readability
 * - Immutable design (StatelessWidget)
 * 
 * Note: This widget is currently not used in the main app but serves
 * as a reusable component for future text display needs.
 */

/// Custom text widget with consistent styling
/// This StatelessWidget provides styled text with Poppins font
class TextWidget extends StatelessWidget {
  /// Constructor that accepts text content to display
  ///
  /// Parameters:
  /// - text: The string content to be displayed
  /// - key: Optional widget key for identification
  const TextWidget(
    this.text, {
    super.key,
  });

  /// The text content to be displayed
  /// This field is final (immutable) as the widget is stateless
  final String text;

  /// Builds the styled text widget
  ///
  /// Returns a Text widget with custom Poppins font styling
  @override
  Widget build(context) {
    return Text(
      // The text content to display
      text,

      // Apply custom styling with Poppins font
      style: GoogleFonts.poppins(
        // White color for good contrast against gradient background
        color: const Color.fromARGB(255, 255, 255, 255),

        // Large font size for excellent readability
        fontSize: 40,

        // Medium font weight for balanced appearance
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
