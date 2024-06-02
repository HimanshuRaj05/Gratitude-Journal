import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gratitude_journal/models/journal_entry.dart';
import 'package:gratitude_journal/pages/affirmations/daily_affirmation.dart';
import 'package:gratitude_journal/pages/journal_entry/entry_page.dart';
import 'package:gratitude_journal/pages/user_info/first_journal.dart';
import 'package:gratitude_journal/pages/journal_entry/journal_page.dart';
import 'package:gratitude_journal/utils/emoji_tile.dart';
import 'package:gratitude_journal/utils/new_alert_dialog.dart';
import 'package:gratitude_journal/utils/new_emoji_tile.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imageNameList = ['awesome', 'happy', 'okay', 'bad', 'terrible'];
  List<String> titleList = ['Awesome', 'Happy', 'Okay', 'Bad', 'Terrible'];

  List<String> nameList = [
    'lib/images/awesome.png',
    'lib/images/happy.png',
    'lib/images/okay.png',
    'lib/images/bad.png',
    'lib/images/terrible.png'
  ];

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

  List<bool> isClickedList = [false, false, false, false, false];

  void changeBool(int index) {
    setState(() {
      for (int i = 0; i < isClickedList.length; i++) {
        if (i == index) {
          continue;
        }
        isClickedList[i] = false;
      }
      isClickedList[index] = !isClickedList[index];
    });
  }

  @override
  void initState() {
    super.initState();
    final obj = context.read<JournalEntry>();
    obj.loadData();
  }

  @override
  Widget build(BuildContext context) {
    final obj = context.read<JournalEntry>();

    void _showDialog(BuildContext context) {
      int probIndex = -1;

      for (int i = 0; i < isClickedList.length; i++) {
        if (isClickedList[i]) {
          probIndex = i;
          break;
        }
      }

      if (probIndex == -1) {
        obj.addProbableEmotion(2);
      } else {
        obj.addProbableEmotion(probIndex);
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return NewAlertDialog(imageIndex: probIndex);
        },
      );

      Future.delayed(Duration(seconds: 4), () {
        Navigator.of(context).pop();
        bool entryPresent = obj.messages.isNotEmpty;

        if (!entryPresent) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FirstJournal()));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => EntryPage()));
        }
      });
    }

    return Consumer<JournalEntry>(
      builder: (context, value, child) => Scaffold(
        bottomNavigationBar: Container(
          color: Color.fromARGB(255, 242, 242, 242),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GNav(
              selectedIndex: 0,
              onTabChange: (index) {
                if (index == 0) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                } else if (index == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DailyAffirmation()));
                } else if (index == 2) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => JournalPage()));
                }
              },
              backgroundColor: Color.fromARGB(255, 242, 242, 242),
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade700,
              gap: 4,
              padding: EdgeInsets.all(12),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: 'Affirmations',
                ),
                GButton(
                  icon: Icons.note_add,
                  text: 'Journal',
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "Hey " + obj.getUserName() + "! How are you feeling today?",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontSize: 25),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 370,
                child: GridView.builder(
                  //shrinkWrap: true,
                  //physics: ScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.75, crossAxisCount: 3),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return

                        //NewEmojiTile(imagePathVal: nameList[index]);

                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 8),
                            child: GestureDetector(
                              onTap: () => changeBool(index),
                              child: EmojiTile(
                                isClicked: isClickedList[index],
                                textColor: colorList[index],
                                imageName: nameList[index],
                                bgColor: bgcolorList[index],
                                title: titleList[index],
                              ),
                            ));
                  },
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: GestureDetector(
                        onTap: () => _showDialog(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 136, 198, 117),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              'Go to Gratitude Journal',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
