import 'package:flutter/material.dart';

class MyAlertDialog extends StatefulWidget {
  const MyAlertDialog({super.key});

  @override
  State<MyAlertDialog> createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  List<String> promptList = [
    'What are you grateful for?',
    "What's the one thing that drove your action",
    "What was the best part of your day?",
    "What made you smile today?",
    "What is something beautiful you saw today?",
    "What is something you enjoyed doing today?"
  ];
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select a prompt ✨'),
      content: Container(
        height: 200,
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: promptList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(promptList[index]),
              onTap: () {
                Navigator.of(context)
                    .pop(index); // Return the index when tapped
              },
            );
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context)
                .pop(); // Close the dialog without returning anything
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
