import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gratitude_journal/models/journal_entry.dart';
import 'package:gratitude_journal/pages/affirmations/daily_affirmation.dart';
import 'package:gratitude_journal/pages/journal_entry/journal_page.dart';
import 'package:gratitude_journal/utils/my_alert_dialog.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController.text = "My New Entry";
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ));
  }

  List<String> promptList = [
    'What are you grateful for?',
    "What's the one thing that drove your action?",
    "What was the best part of your day?",
    "What made you smile today?",
    "What is something beautiful you saw today?",
    "What is something you enjoyed doing today?"
  ];

  int? selectedIndex;

  Future<void> _showDialog() async {
    final result = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return MyAlertDialog();
      },
    );

    if (result != null) {
      setState(() {
        selectedIndex = result;
        _textEditingController.text = promptList[selectedIndex!];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();

    String formattedDate = DateFormat('dd MMM yyyy').format(currentDate);

    void addEntry() {
      final obj = context.read<JournalEntry>();

      String fDate = formattedDate;
      String fTitle = _textEditingController.text;
      String fMessage = _messageController.text;
      int fEmotion = obj.getProbableEmotions();

      obj.addDate(fDate);
      obj.addTitle(fTitle);
      obj.addMessage(fMessage);
      obj.addEmotion(fEmotion);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => JournalPage()));
    }

    return Consumer<JournalEntry>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: Color.fromARGB(255, 254, 236, 230),
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            formattedDate,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              color: Color.fromARGB(255, 136, 198, 117),
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: GestureDetector(
                            onTap: () {
                              _showDialog();
                            },
                            child: Container(
                              width: 180,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 255, 154, 120)),
                              child: Center(
                                  child: Text(
                                'Prompts ✨',
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      cursorColor: Color.fromARGB(255, 136, 198, 117),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                      controller: _textEditingController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide.none)),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 254, 236, 230),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            constraints: BoxConstraints(maxHeight: 150),
                            child: TextField(
                              style: GoogleFonts.poppins(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w400),
                              cursorColor: Color.fromARGB(255, 136, 198, 117),
                              controller: _messageController,
                              maxLines: null,
                              decoration: InputDecoration(
                                  hintText: 'Make your journal entry...',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )),
                            )),
                      ),
                    ),

                    // TextFormField(
                    //   minLines: 10,
                    //   maxLines: null,
                    //   keyboardType: TextInputType.multiline,
                    //   decoration: InputDecoration(
                    //       hintText: 'Enter a message',
                    //       hintStyle: TextStyle(
                    //         color: Colors.grey,
                    //       ),
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.all(Radius.circular(15)))),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_messageController.text.isEmpty) {
                          _showSnackBar(
                              context, "Journal entry could not be empty!");
                        } else {
                          addEntry();
                        }
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                        child: Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 136, 198, 117)),
                          child: Center(
                              child: Text(
                            'Submit entry',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
