import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gratitude_journal/pages/user_info/first_journal.dart';

class NewAlertDialog extends StatefulWidget {
  NewAlertDialog({super.key, required this.imageIndex});
  int imageIndex;

  @override
  State<NewAlertDialog> createState() => _NewAlertDialogState();
}

class _NewAlertDialogState extends State<NewAlertDialog> {
  late int randomNumber;

  @override
  void initState() {
    super.initState();
    generateRandomNumber();
  }

  void generateRandomNumber() {
    Random random = Random();
    randomNumber = random.nextInt(5);
  }

  List<List<String>> quotesList = [
    [
      "It's great to hear you're feeling awesome. Maybe you could journal what made you feel awesome today!",
      "Fantastic! You're feeling awesome! Why not capture what made your day so great in your journal?",
      "It's amazing that you're feeling awesome today! Consider jotting down the moments that made it special.",
      "So glad to hear you're feeling awesome! Writing about what made your day awesome could be a great memory to look back on.",
      "Awesome! You're in a great mood! Sharing what made you feel this way in your journal can spread the positivity."
    ],
    [
      "Wonderful to know you're feeling happy! How about journaling what brought you joy today?",
      "It's great to hear you're happy! Writing down the moments that made you smile could brighten your day even more.",
      "So glad you're feeling happy! Reflecting on the little things that made you happy today can be a great journaling topic.",
      "Feeling happy is awesome! Consider capturing the highlights of your day in your journal.",
      "Happiness is contagious! Sharing what made you happy in your journal can help you cherish those moments."
    ],
    [
      "Glad to hear you're feeling okay. Reflecting on what made you feel content today could be insightful.",
      "Feeling okay is perfectly fine. Maybe jotting down the moments that kept you balanced today could be helpful.",
      "It's good to know you're doing okay. Writing about your day might help you see the silver linings.",
      "An okay day is still a day worth noting. Consider journaling about what made it just okay and what could make it better.",
      "Being okay is a step towards feeling great. Reflecting on your day in your journal might bring some clarity."
    ],
    [
      "I'm sorry to hear you're feeling bad. Writing about your day might help lighten the load.",
      "Tough days happen. Journaling your thoughts and feelings can be a helpful way to process them.",
      "It’s hard to feel bad. Maybe expressing your thoughts in your journal can help you find some relief.",
      "Bad days can be challenging. Reflecting on what made today tough in your journal might help you gain some perspective.",
      "I'm sorry you're having a bad day. Writing down your feelings could be a step towards feeling better."
    ],
    [
      "I'm truly sorry to hear you're feeling terrible. Taking some time to write about your emotions might provide some comfort.",
      "Feeling terrible is tough. Writing down your thoughts and acknowledging your feelings can be a first step toward healing.",
      "It's okay to feel terrible sometimes. Consider journaling as a way to express and release those emotions.",
      "I understand it's a difficult time for you. Journaling about your struggles may help you find some solace and clarity.",
      "I'm here to support you through this tough time. Writing about your feelings, no matter how terrible, can be a therapeutic outlet for processing your emotions."
    ],
    [
      "Every day is unique. Consider journaling about your experiences and thoughts from today—it can be a great way to reflect and find clarity.",
      "Your thoughts matter. Take a moment to jot down your reflections from today—it's a chance to capture your journey.",
      "Writing can be therapeutic. Whether it was a day of highs or lows, putting pen to paper can help you process and grow.",
      "No matter how your day went, writing about it can be a form of self-care. Take a moment to document your experiences and feelings.",
      "Every day holds stories worth telling. Why not take a moment to record your thoughts and memories—it's a gift to your future self."
    ]
  ];

  List<String> imageNameList = ['awesome', 'happy', 'okay', 'bad', 'terrible'];
  List<String> titleList = ['Awesome', 'Happy', 'Okay', 'Bad', 'Terrible'];

  List<Color> bgcolorList = [
    Color.fromARGB(100, 249, 245, 148),
    Color.fromARGB(100, 247, 183, 210),
    Color.fromARGB(100, 166, 224, 244),
    Color.fromARGB(100, 158, 187, 219),
    Color.fromARGB(100, 238, 98, 109),
  ];

  @override
  // void initState() async {
  //   // TODO: implement initState
  //   super.initState();
  //   await Future.delayed(Duration(seconds: 3), () {});

  //   Navigator.of(context).pop();

  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => FirstJournal()));
  // }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 200,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(7),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: widget.imageIndex == -1
                      ? Color.fromARGB(100, 166, 224, 244)
                      : bgcolorList[widget.imageIndex]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.imageIndex == -1
                        ? 'lib/images/okay.png'
                        : 'lib/images/' +
                            imageNameList[widget.imageIndex] +
                            '.png',
                    width: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.imageIndex == -1 ? "" : titleList[widget.imageIndex],
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  widget.imageIndex == -1
                      ? quotesList[5][randomNumber]
                      : quotesList[widget.imageIndex][randomNumber],
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
