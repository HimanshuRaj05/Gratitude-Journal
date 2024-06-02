import 'package:flutter/material.dart';

class NewEmojiTile extends StatelessWidget {
  NewEmojiTile({super.key, required this.imagePathVal});
  String imagePathVal;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Image.asset(
        imagePathVal,
        height: 80,
      ),
    );
  }
}
