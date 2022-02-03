import 'package:dnd_classes_app/defaults/defaults.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CardWidget extends StatefulWidget {
  final String imagePath;
  final String txt;
  const CardWidget({
    required this.imagePath,
    required this.txt,

    Key? key }) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool apiCall = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        top: 10.0,
        left: 5.0,
        right: 5.0,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      color: buttonBackgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.txt,
                style: GoogleFonts.permanentMarker(
                color: buttonTextColor,
                fontSize: 30,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}