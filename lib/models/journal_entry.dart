import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class JournalEntry extends ChangeNotifier {
  final _myBox = Hive.box('mybox');
  List<String> dates = [];

  String userName = "";

  void loadData() {
    userName = _myBox.get("USERNAME");

    // if (_myBox.get("PROBABLE_EMOTIONS") != null) {
    //   probable_emotions = _myBox.get("PROBABLE_EMOTIONS");
    // }

    if (_myBox.get("DATES") != null) {
      dates = _myBox.get("DATES");
    }

    if (_myBox.get("TITLES") != null) {
      titles = _myBox.get("TITLES");
    }

    if (_myBox.get("MESSAGES") != null) {
      messages = _myBox.get("MESSAGES");
    }

    if (_myBox.get("EMOTIONS") != null) {
      emotions = _myBox.get("EMOTIONS");
    }
  }

  void setUserName(String name) {
    userName = name;
    _myBox.put("USERNAME", name);
  }

  String getUserName() {
    return userName;
  }

  List<String> titles = [];

  List<String> messages = [];

  List<int> emotions = [];

  List<int> probable_emotions = [];

  void addDate(String value) {
    dates.add(value);
    _myBox.put("DATES", dates);
    notifyListeners();
  }

  int getLength() {
    return messages.length;
  }

  String getDate(int index) {
    return dates[index];
  }

  void addTitle(String value) {
    titles.add(value);
    _myBox.put("TITLES", titles);
    notifyListeners();
  }

  String getTitle(int index) {
    return titles[index];
  }

  void addMessage(String value) {
    messages.add(value);
    _myBox.put("MESSAGES", messages);
    notifyListeners();
  }

  String getMessage(int index) {
    return messages[index];
  }

  void addEmotion(int value) {
    emotions.add(value);
    _myBox.put("EMOTIONS", emotions);
    notifyListeners();
  }

  int getEmotion(int index) {
    return emotions[index];
  }

  void addProbableEmotion(int value) {
    probable_emotions.add(value);
    notifyListeners();
  }

  int getProbableEmotions() {
    int len = probable_emotions.length;

    return probable_emotions[len - 1];
  }
}
