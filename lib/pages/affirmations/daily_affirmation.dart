import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gratitude_journal/pages/user_info/home_screen.dart';
import 'package:gratitude_journal/pages/journal_entry/journal_page.dart';

class DailyAffirmation extends StatefulWidget {
  const DailyAffirmation({super.key});

  @override
  State<DailyAffirmation> createState() => _DailyAffirmationState();
}

class _DailyAffirmationState extends State<DailyAffirmation> {
  List<Color> colorList = [
    Color.fromARGB(255, 253, 252, 211),
    Color.fromARGB(255, 251, 222, 234),
    Color.fromARGB(255, 220, 238, 244),
    Color.fromARGB(255, 202, 210, 219),
    Color.fromARGB(255, 238, 173, 178),
  ];

  List<String> affirmations = [
    "I am grateful for many things in my life that bring me joy and comfort.",
    "I trust that what's meant for me is already mine, regardless of how and when it is mine.",
    "I am worthy of beautiful endings and exciting beginnings.",
    "I allow my voice to be heard, my thoughts to be expressed and my vision to be seen.",
    "I am open to things working out for me. I am open to receiving abundance. I am open to connecting with my highest self.",
    "I am eternally grateful for all of the blessings I have in my life."
        "I am happy and grateful for everything I have and receive daily.",
    "I constantly remind myself to enjoy all the good I have in my life right now.",
    "I express deep appreciation for the small steps I achieve each day.",
    "With every breath I take, I am bringing more and more gratitude into my life.",
    "Today, I will concentrate on taking one step forward, however small.",
    "My life is meaningful and important; I am a valuable contributor to the greater good.",
    "I am worthy because I say so. My worth is in my hands.",
    "I release the amount of pressure I put on myself.",
    "I give myself permission to trust myself, my guidance, and my intuition.",
    "All the good in my life comes to me as a result of my willingness to find happiness in each moment.",
    "Every kind word I express comes back to me multiplied.",
    "Everything that is happening now is happening for my ultimate good.",
    "I realize there will be obstacles but I have the strength to get through them.",
    "I choose to be kind to myself and love myself unconditionally.",
    "I see problems as challenges that evolve me and make me grow.",
    "I always treat others the way I expect to be treated.",
    "Each day even if it’s for a few minutes I’m going to stop and be grateful for all of life’s beauty.",
    "Every day I’m going to be more mindful of all of the small blessings that I should be thankful for.",
    "I am thankful that with each experience I become a better version of myself.",
    "I create the possibility of happiness for others by being happy.",
    "It does not matter what other people say or do. What matters is how I choose to react and what I choose to believe about myself.",
    "I return to the basics of life: forgiveness, courage, gratitude, love, and humor.",
    "I am creating a life that feels good and I am in charge of my happiness.",
    "Happiness is within me. I base my happiness on my own accomplishments and the blessings I've been given.",
    "I am humble and continue to learn every day.",
    "Being kind toward others is very important to me, and I exercise kindness throughout my day.",
    "As I focus on compassion, I naturally relate to others with love and understanding.",
    "I am not afraid of what could go wrong. I am excited about what could go right.",
    "Where I think I am lost, I am ready to feel found.",
    "As I forgive myself, it becomes easier to forgive others.",
    "I have the freedom and power to create the life I desire.",
    "Day by day and thought by thought, I am creating my ideal life!",
    "I am grateful for everything, the good and the bad because it made me.",
    "I am ready to encounter opportunities I never thought were possible.",
    "Today, I choose to think positively and create an amazing and successful life for myself.",
    "Each day, I am bold, and I walk on my path with courage!",
    "I am the architect of my life. I build its foundation and choose its contents. I decorate my life with hope, healing, and gratitude.",
    "Self-acceptance, self-love, and self-care are the habits that I choose to cultivate. I am practicing loving my life.",
    "I trust myself and turn inward to seek my highest truth.",
    "I am worthy of great love and I deserve to be loved fully and completely.",
    "Each and every day I learn new lessons, expand my awareness, and develop my abilities.",
    "Today I am planting the seeds of growth in my life. I am absolutely committed to watering them every day.",
    "I am focusing on the joy of living my life and helping others where and when I can.",
    "Every person on this planet enriches my life in some way or another. I am thankful to all."
  ];

  late int randomNumber = 0;
  late int randomNumber1 = 0;

  @override
  void initState() {
    super.initState();
    generateRandomNumber();
    generateRandomNumber1();
  }

  void generateRandomNumber() {
    Random random = Random();
    randomNumber = random.nextInt(affirmations.length);
  }

  void generateRandomNumber1() {
    Random random = Random();
    randomNumber1 = random.nextInt(5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 242, 242, 242),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
              selectedIndex: 1,
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
              ]),
        ),
      ),
      backgroundColor: colorList[randomNumber1],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Daily Affirmation✨',
                style: GoogleFonts.poppins(
                    fontSize: 25,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: Center(
                    child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "\"" + affirmations[randomNumber] + "\"",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade800,
                    fontSize: 16),
              ),
            )))
          ],
        ),
      ),
    );
  }
}
