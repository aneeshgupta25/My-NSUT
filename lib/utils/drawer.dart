import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_iosd/profile_route.dart';
import 'package:my_iosd/time_table,dart.dart';
import 'package:my_iosd/to_do_route.dart';

import '../attendance_route.dart';
import 'custom_page_route.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  //Provides widget for the drawer
  Widget getCardForDrawer(String tag, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        if (tag == 'Profile') {
          Navigator.push(
            context,
            CustomPageRoute(child: ProfileRoute()),
          );
        } else if (tag == 'Attendance') {
          Navigator.push(
            context,
            CustomPageRoute(child: AttendanceRoute()),
          );
        } else if (tag == 'Time Table') {
          Navigator.push(
            context,
            CustomPageRoute(child: TimeTableRoute()),
          );
        } else if (tag == 'To Do') {
          Navigator.push(
            context,
            CustomPageRoute(child: ToDoRoute()),
          );
        }
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 60,
          )
        ]),
        child: Card(
          elevation: 20,
          shadowColor: Colors.black,
          margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xFF1b1f2b),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        tag,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1b1f2b),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView(
          reverse: false,
          padding: const EdgeInsets.only(left: 5, right: 5),
          children: [
            //My Info (Profile Pic + Name + Roll no)
            Column(
              children: [
                const CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 54,
                    backgroundImage: AssetImage('images/aneesh.jpeg'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: const Text(
                    'ANEESH GUPTA',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: const Text(
                    '2021UCS1720',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                )
              ],
            ),
            getCardForDrawer('Profile', context),
            getCardForDrawer('Attendance', context),
            getCardForDrawer('Time Table', context),
            getCardForDrawer('To Do', context),
            getCardForDrawer('Notices', context),
            getCardForDrawer('Syllabus', context),
            getCardForDrawer('Previous Year Papers', context),
            getCardForDrawer('Courses', context),
            getCardForDrawer('Results', context),
            getCardForDrawer('Societies', context),
            getCardForDrawer('Events', context),
            getCardForDrawer('Faculty Time Table', context),
            getCardForDrawer('About Us', context),
            getCardForDrawer('FAQs', context),
            Container(
              margin: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 90, right: 90),
              height: 35,
              width: 50,
              decoration: const BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  )),
              child: const Center(
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
