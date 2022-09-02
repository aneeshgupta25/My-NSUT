import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_iosd/utils/drawer.dart';

import 'attendance_route.dart';
import 'home_route.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainRoute(),
  ));
}

class MainRoute extends StatefulWidget {
  const MainRoute({Key? key}) : super(key: key);

  @override
  State<MainRoute> createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute> {
  int _selected_index = 2;
  int currentPage = 2;
  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(
      initialPage: currentPage,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selected_index = index;
      currentPage = index;
      pageController.jumpToPage(index);
    });
  }

  //creates security Dialog
  createDialog(BuildContext context) {
    print('yahan aya');
    return showDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: const AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                backgroundColor: Color(0xFF424242),
                title: Text(
                  'Your data is safe',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFfd426a),
                    fontFamily: 'Montserrat',
                  ),
                ),
                content: Text(
                  'NSUTx is using IMS APIs to display a student\'s information.\nAll your data is completely secured.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500),
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFfd426a)),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        drawer: const NavigationDrawer(),
        backgroundColor: const Color(0xFF1b1f2b),
        body: PageView(
          controller: pageController,
          onPageChanged: (newPage) {
            setState(() {
              currentPage = newPage;
              _selected_index = newPage;
              pageController.animateToPage(newPage,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
            });
          },
          children: const [
            Center(
              child: Text(
                'My\nTime-Table',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),
            AttendanceRoute(),
            MyStateFullApp(),
            Center(
              child: Text(
                'My Tasks',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                'Notices',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.watch_later_outlined),
              label: 'Time-Table',
              backgroundColor: Color(0xFF1b1f2b),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.spellcheck),
              label: 'Attendance',
              backgroundColor: Color(0xFF1b1f2b),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              label: 'Home',
              backgroundColor: Color(0xFF1b1f2b),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.checklist),
              label: 'To-Do',
              backgroundColor: Color(0xFF1b1f2b),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notices',
              backgroundColor: Color(0xFF1b1f2b),
            ),
          ],
          currentIndex: _selected_index,
          selectedItemColor: const Color(0xFFfd426a),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
