// Import statements for Flutter framework and app components
import 'package:flutter/cupertino.dart'; // Cupertino widgets
import 'package:flutter/material.dart'; // Material Design widgets
import 'package:myapp/dice_roller.dart'; // Dice roller widget

/**
 * GRADIENT CONTAINER WIDGET
 * 
 * This widget creates a beautiful gradient background container that serves
 * as the main visual foundation for the dice roller app.
 * 
 * Features:
 * - Customizable gradient colors
 * - Diagonal gradient from top-left to bottom-right
 * - Centers the dice roller widget
 * - Fills the entire screen space
 * - Immutable design (StatelessWidget)
 */

/// Gradient start position - top-left corner
/// This constant defines where the gradient begins
const startAlignment = Alignment.topLeft;

/// Gradient end position - bottom-right corner
/// This constant defines where the gradient ends
const endAlignment = Alignment.bottomRight;

/// Custom gradient container widget
/// This StatelessWidget creates a gradient background with centered content
class GradientContainer extends StatelessWidget {
  /// Constructor that accepts a list of colors for the gradient
  ///
  /// Parameters:
  /// - colors: List of Color objects that define the gradient
  /// - key: Optional widget key for identification
  const GradientContainer(
    this.colors, {
    super.key,
  });

  /// List of colors used to create the gradient effect
  /// This field is final (immutable) as the widget is stateless
  final List<Color> colors;

  /// Builds the widget tree for the gradient container
  ///
  /// Returns a Container with gradient decoration and centered dice roller
  @override
  Widget build(context) {
    return Container(
      // Apply gradient background decoration
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // Use the provided colors for the gradient
          colors: colors,

          // Start gradient from top-left
          begin: startAlignment,

          // End gradient at bottom-right
          end: endAlignment,
        ),
      ),

      // Center the dice roller widget within the container
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
