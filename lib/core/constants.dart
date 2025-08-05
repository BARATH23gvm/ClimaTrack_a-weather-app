import 'package:flutter/material.dart';

const double containerPadding = 10;
const double sizeOfAll = 30;

const Color headerBackground = Color(0xFF0D47A1);

const Color visibilityColor = Color(0xFFF4511E); // Orange (for visibility)
const Color humidityColor = Color(0xFF388E3C); // Green
const Color windSpeedColor = Color(0xFF1565C0); // Dark Blue
const Color dewPointColor = Color(0xFF6A1B9A); // Purple
const Color cloudCoverColor = Color(0xFF607D8B); // Blue Grey
const Color pressureColor = Color(0xFF795548); // Brown
const Color uvIndexColor = Color(0xFFFFC107); // Amber
const Color feelsLikeColor = Color(0xFF1976D2); // Blue (same as maxTemp)

const TextStyle StyleforlargeText = TextStyle(
  color: Colors.white,
  fontSize: 25,
  fontWeight: FontWeight.w400,
);
const TextStyle StyleforValues = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.w400,
);
const TextStyle StyleforsmallText = TextStyle(
  color: Colors.white,
  fontSize: 15,
  fontWeight: FontWeight.w400,
);

// Soft Multi-color Gradient Background (Subtle Rainbow Frosted)
const LinearGradient multiColorCardBackground = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    // Soft White Base
    Color(0xAEDAE3FF), // Light Blue
    Color(0xFFF8BBD5), // Light Pink
    Color(0xFFC8E6C9), // Light Green
    Color(0xF6EEB5FF), // Light Yellow
  ],
);

Icon completeIconStyle(IconData input) {
  return Icon(input, size: 50, color: Colors.white);
}
