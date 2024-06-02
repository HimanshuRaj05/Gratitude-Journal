import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmojiTile extends StatefulWidget {
  EmojiTile(
      {super.key,
      required this.imageName,
      required this.title,
      required this.textColor,
      required this.isClicked,
      required this.bgColor});
  String imageName;
  String title;
  Color textColor;
  bool isClicked;
  Color bgColor;

  @override
  State<EmojiTile> createState() => _EmojiTileState();
}

class _EmojiTileState extends State<EmojiTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 3),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              15,
            ),
            border: Border.all(
              color: widget.isClicked ? widget.textColor : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1), // Shadow color
                spreadRadius: 2, // Spread radius
                blurRadius: 10, // Blur radius
                offset: Offset(0, 3), // Offset to move the shadow
              ),
            ],
            color: widget.isClicked ? widget.bgColor : Colors.white),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                widget.imageName,
                width: 80,
              ),
              Text(
                widget.title,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: widget.isClicked ? Colors.white : widget.textColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
