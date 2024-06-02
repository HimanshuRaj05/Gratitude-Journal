import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JournalTile extends StatefulWidget {
  JournalTile(
      {super.key,
      required this.message,
      required this.title,
      required this.date,
      required this.emotion});

  String message;
  String title;
  String date;
  int emotion;

  @override
  State<JournalTile> createState() => _JournalTileState();
}

List<Color> colorList = [
  Color.fromARGB(255, 249, 245, 148),
  Color.fromARGB(255, 247, 183, 210),
  Color.fromARGB(255, 166, 224, 244),
  Color.fromARGB(255, 158, 187, 219),
  Color.fromARGB(255, 238, 98, 109),
];

List<Color> bgcolorList = [
  Color.fromARGB(100, 249, 245, 148),
  Color.fromARGB(100, 247, 183, 210),
  Color.fromARGB(100, 166, 224, 244),
  Color.fromARGB(100, 158, 187, 219),
  Color.fromARGB(100, 238, 98, 109),
];

class _JournalTileState extends State<JournalTile> {
  List<String> imageNameList = ['awesome', 'happy', 'okay', 'bad', 'terrible'];
  List<String> titleList = ['Awesome', 'Happy', 'Okay', 'Bad', 'Terrible'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 242, 242, 242),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: Colors.grey.shade700,
                            ),
                            Text(
                              widget.date,
                              style: GoogleFonts.poppins(
                                  color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: bgcolorList[widget.emotion]),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        'lib/images/' + imageNameList[widget.emotion] + ".png",
                        height: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        titleList[widget.emotion],
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: colorList[widget.emotion]),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: bgcolorList[widget.emotion],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.message,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, color: Colors.grey.shade700),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
