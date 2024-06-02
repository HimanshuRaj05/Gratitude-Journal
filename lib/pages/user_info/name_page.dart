import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gratitude_journal/models/journal_entry.dart';
import 'package:gratitude_journal/pages/user_info/home_screen.dart';
import 'package:provider/provider.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    return Consumer(
        builder: (context, value, child) => Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Text(
                        'Before we begin',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 136, 198, 117),
                            fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Text(
                        "Let's start with something special: your lovely name?",
                        style: GoogleFonts.poppins(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        cursorColor: Color.fromARGB(255, 136, 198, 117),
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade600),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade600),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SvgPicture.asset(
                        'lib/images/namepic.svg',
                        width: 370,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: GestureDetector(
                        onTap: () {
                          if (_nameController.text.isEmpty) {
                            _showSnackBar(
                                context, "Please enter your name to continue!");
                          } else {
                            final obj = context.read<JournalEntry>();

                            obj.setUserName(_nameController.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          }
                        },
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 136, 198, 117)),
                          width: double.maxFinite,
                          child: Center(
                            child: Text(
                              'Continue',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
