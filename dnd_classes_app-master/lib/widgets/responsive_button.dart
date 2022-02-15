import 'package:dnd_classes_app/defaults/defaults.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResponsiveButton extends StatelessWidget {
  final double? width;
  final String buttonText;
  final double fontSize;
  final double bottomMargin;
  final double topMargin;

  const ResponsiveButton({
    Key? key,
    required this.fontSize,
    required this.width,
    required this.buttonText,
    required this.bottomMargin,
    required this.topMargin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: topMargin,
        bottom: bottomMargin,
      ),
      width: width,
      height: 60,
      child: Center(
        child: Text(
          buttonText,
          style: GoogleFonts.permanentMarker(
                fontSize: fontSize,
                color: buttonBackgroundColor,
            ),
          ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: buttonTextColor,
      ),
    );
  }
}