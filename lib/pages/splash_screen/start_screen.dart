import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gratitude_journal/pages/user_info/home_screen.dart';
import 'package:gratitude_journal/pages/user_info/name_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final _myBox = Hive.box('mybox');
  bool userPresent = false;
  String introText =
      "Keeping a log of what you're thankful for daily can enhance your well-being by reducing stress, improving sleep, and promoting heart health.";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (_myBox.get("USERNAME") != null) {
      userPresent = true;
    }

    navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});

    if (!userPresent) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => NamePage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 45),
                child: Text(
                  'BEING POSITIVE',
                  style: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 136, 198, 117),
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
              ),
            ),
            SvgPicture.asset(
              'lib/images/grat_pic.svg',
              width: 400,
            ),
            Text(
              'Gratitude Journal',
              style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 25),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  introText,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 136, 136, 136),
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
