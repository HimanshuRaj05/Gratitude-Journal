import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gratitude_journal/models/journal_entry.dart';
import 'package:gratitude_journal/pages/affirmations/daily_affirmation.dart';
import 'package:gratitude_journal/pages/user_info/home_screen.dart';
import 'package:gratitude_journal/utils/journal_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

int globalCount = 0;

class _JournalPageState extends State<JournalPage> {
  @override
  void initState() {
    super.initState();
    final _myBox = Hive.box('mybox');
    final obj = context.read<JournalEntry>();
    obj.loadData();
    globalCount =
        obj.dates.length; // Assuming messages holds the actual entries
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<JournalEntry>(
        builder: (context, value, child) => Scaffold(
              bottomNavigationBar: Container(
                color: Color.fromARGB(255, 242, 242, 242),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: GNav(
                      selectedIndex: 2,
                      onTabChange: (index) {
                        if (index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        } else if (index == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DailyAffirmation()));
                        } else if (index == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JournalPage()));
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
                      ]),
                ),
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 17, bottom: 30),
                        child: Text(
                          'All Journal',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 136, 198, 117),
                              fontSize: 31),
                        ),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: globalCount,
                            itemBuilder: (context, index) {
                              final obj1 = context.read<JournalEntry>();
                              int newIndex = globalCount - 1 - index;

                              return JournalTile(
                                  message: obj1.getMessage(newIndex),
                                  title: obj1.getTitle(newIndex),
                                  date: obj1.getDate(newIndex),
                                  emotion: obj1.getEmotion(newIndex));
                            }))
                  ],
                ),
              ),
            ));
  }
}
