import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final onPressed;

  @override
  Size get preferredSize => const Size.fromHeight(100);
  const CustomAppBar({
    Key? key,
    this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: onPressed,
           icon: const Icon(
             Icons.arrow_left,
             size: 40,
             ),
          ),
          Text(
            title,
            style: GoogleFonts.permanentMarker(
              fontSize: 40,
            )
          ),
        ],
        ),
        flexibleSpace: const Image(
          image: AssetImage(r'lib\assets\photos\dnd-hermit.jpg'),
          fit: BoxFit.cover,
        ),
    );
  }
}