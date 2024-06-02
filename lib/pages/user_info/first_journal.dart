import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gratitude_journal/pages/journal_entry/entry_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstJournal extends StatefulWidget {
  const FirstJournal({super.key});

  @override
  State<FirstJournal> createState() => _FirstJournalState();
}

class _FirstJournalState extends State<FirstJournal> {
  String gratQuote =
      "✨\"Gratitude unlocks the fullness of life. It turns what we have into enough, and more. It turns denial into acceptance, chaos to order, confusion to clarity. It can turn a meal into a feast, a house into a home, a stranger into a friend.\"✨ - Melody Beattie";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                gratQuote,
                style: GoogleFonts.poppins(
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SvgPicture.asset(
                'lib/images/newgratpic.svg',
                width: 400,
                height: 400,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => EntryPage()));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 136, 198, 117),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            weight: 2,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            'Write Your First Journal Entry',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
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
