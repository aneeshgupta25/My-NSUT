import 'package:flutter/material.dart';
import 'package:my_iosd/model/menu_model.dart';

class Menu {
  final List<MenuModel> _list = [
    MenuModel(Icons.person, 'Profile'),
    MenuModel(Icons.spellcheck, 'Attendance'),
    MenuModel(Icons.checklist, 'ToDo'),
    MenuModel(Icons.access_time, 'Time Table'),
    MenuModel(Icons.menu_book, 'Syllabus'),
    MenuModel(Icons.library_books, 'Previous\nYear Papers'),
    MenuModel(Icons.bar_chart_rounded, 'Result'),
    MenuModel(Icons.book, 'Courses'),
    //Todo: Update the below icon
    MenuModel(Icons.night_shelter, 'Societies'),
    MenuModel(Icons.event_available, 'Events'),
  ];

  List<MenuModel> getList() {
    return _list;
  }
}

// getColumn(Icons.person, 'Profile'),
//         getColumn(Icons.spellcheck, 'Attendance'),
//         getColumn(Icons.checklist, 'ToDo'),
//         getColumn(Icons.access_time, 'Time Table'),
// getColumn(Icons.menu_book, 'Syllabus'),
//         getColumn(Icons.library_books, '   Previous\nYear Papers'),
//         getColumn(Icons.bar_chart_rounded, 'Result'),
//         getColumn(Icons.book, 'Courses'),
