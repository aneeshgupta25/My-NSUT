import 'package:flutter/material.dart';
import 'package:my_iosd/data/attendance_data.dart';
import 'package:my_iosd/utils/drawer.dart';
import 'model/attendance_model.dart';

class AttendanceRoute extends StatefulWidget {
  const AttendanceRoute({Key? key}) : super(key: key);

  @override
  State<AttendanceRoute> createState() => _AttendanceRouteState();
}

class _AttendanceRouteState extends State<AttendanceRoute> {
  List<AttendanceModel> attendanceList = [];
  AttendanceData attendanceData = AttendanceData();

  @override
  Widget build(BuildContext context) {
    //getting list of attendance
    attendanceList = attendanceData.getAttendanceList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Theme(
          data: ThemeData(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFfd426a)),
          ),
          child: Scaffold(
            // drawer: NavigationDrawer(),
            backgroundColor: const Color(0xFF1b1f2b),
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    'Attendance',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Montserrat'),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 5),
                  child: const Text(
                    'Semester-3',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Montserrat'),
                  ),
                ),
                const Card(
                  margin: EdgeInsets.only(top: 15, bottom: 10),
                  color: Color(0xFFfe416a),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: Text(
                      'Attendance Calculator',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0xFF1b1f2b),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: ListView.builder(
                      itemCount: attendanceList.length,
                      itemBuilder: (BuildContext context, int index) {
                        AttendanceModel model = attendanceList[index];
                        double attendance =
                            model.getClassesAttended() / model.getClassesHeld();
                        int classesToTake = 0;
                        if (attendance < 0.75) {
                          int minClassesToGet75 =
                              (model.getTotalClasses() * 0.75).truncate();
                          classesToTake =
                              minClassesToGet75 - model.getClassesAttended();
                        }
                        return getAttendanceCard(model.getCourseCode(),
                            model.getCourseName(), attendance, classesToTake);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getAttendanceCard(String courseCode, String courseName, double attendance,
      int classesToTake) {
    return Container(
      height: 110,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xFFE3EAEF),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 85,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                color: getColorForAttendance(attendance)),
            child: Row(
              children: [
                Flexible(
                  flex: 80,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          courseCode,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              letterSpacing: 1,
                              color: Color(0xFFE3EAEF),
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          courseName,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              color: Color(0xFFE3EAEF),
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 20,
                  child: Padding(
                    padding:
                        EdgeInsets.only(right: 5, top: 5, left: 5, bottom: 5),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: Stack(
                          children: [
                            Center(
                              child: Text(
                                '${(attendance * 100).truncate()}%',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                                value: attendance,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  getTextToDisplay(classesToTake),
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Color getColorForAttendance(double attendance) {
    if (attendance < 0.75) {
      return const Color(0xFFEB5757);
    } else {
      return const Color(0xFF0ba485);
    }
  }

  String getTextToDisplay(int classesToTake) {
    if (classesToTake == 0) {
      return 'Already in safe zone! Take a nap :)';
    } else {
      return 'Attend $classesToTake more classes to enter safe zone!';
    }
  }
}

//0xFF1b1f2b
//pink - 0xFFfd426a
//attendance green -> 0xFF70CF97
//attendance red -> 0xFFEB5757
