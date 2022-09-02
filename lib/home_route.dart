import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_iosd/attendance_route.dart';
import 'package:my_iosd/data/menu.dart';
import 'package:my_iosd/profile_route.dart';
import 'package:my_iosd/time_table,dart.dart';
import 'package:my_iosd/to_do_route.dart';

import 'package:my_iosd/utils/custom_page_route.dart';
import 'data/attendance_data.dart';
import 'model/attendance_model.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

Menu menu = Menu();

class MyStateFullApp extends StatefulWidget {
  const MyStateFullApp({Key? key}) : super(key: key);

  @override
  State<MyStateFullApp> createState() => _MyStateFullAppState();
}

class _MyStateFullAppState extends State<MyStateFullApp> {
  late DateFormat dateFormat;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  List<AttendanceModel> attendanceList = [];
  AttendanceData attendanceData = AttendanceData();

  //This method returns the column containing icons with text on home screen
  Column getColumn(IconData iconData, String title) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.pink,
          child: CircleAvatar(
            backgroundColor: Color(0xFF1b1f2b),
            radius: 24,
            child: IconButton(
              icon: Icon(iconData),
              splashRadius: 25,
              color: Colors.white,
              onPressed: () {
                if (title == 'Attendance') {
                  Navigator.push(
                    context,
                    CustomPageRoute(child: AttendanceRoute()),
                  );
                } else if (title == 'Profile') {
                  Navigator.push(
                    context,
                    CustomPageRoute(child: ProfileRoute()),
                  );
                } else if (title == 'Time Table') {
                  Navigator.push(
                    context,
                    CustomPageRoute(child: TimeTableRoute()),
                  );
                } else if (title == 'To Do') {
                  Navigator.push(
                    context,
                    CustomPageRoute(child: ToDoRoute()),
                  );
                }
              },
            ),
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontStyle: FontStyle.normal),
        )
      ],
    );
  }

  //return current date
  String getCurrentDate() {
    String date = DateFormat.d().format(DateTime.now());
    String month = DateFormat.MMM().format(DateTime.now());
    String year = DateFormat.y().format(DateTime.now());

    return '$date-$month-$year';
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
    //retrieving data of attendance
    attendanceList = attendanceData.getAttendanceList();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    attendanceList = attendanceData.getAttendanceList();
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);

    print(date);
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color(0xFF1b1f2b),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                      child: SizedBox(
                        height: height * 0.28,
                        width: width,
                        child: Container(
                          child: Image.asset(
                            'images/nsit2.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      )),
                  Positioned(
                    top: (height * 0.28) - 55,
                    child: const CircleAvatar(
                      radius: 55,
                      backgroundColor: Color(0xFF1b1f2b),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 53,
                        backgroundImage: AssetImage('images/aneesh.jpeg'),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    height: height * 0.28,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 40,
                        width: 40,
                        child: IconButton(
                          icon: Image.asset('images/menu.png'),
                          onPressed: () {
                            final ScaffoldState? scaffoldState = context
                                .findRootAncestorStateOfType<ScaffoldState>();
                            scaffoldState?.openDrawer();
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, right: 10),
                    height: height * 0.28,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 40,
                        width: 40,
                        child: IconButton(
                          icon: Icon(Icons.info_outline_rounded),
                          onPressed: () {
                            createDialog(context);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          DateFormat.EEEE().format(DateTime.now()).toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              letterSpacing: 0.5),
                        ),
                        Text(
                          getCurrentDate(),
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0,
                              letterSpacing: 0.5),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  const Text(
                    'Semester-3',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                    ),
                  )
                ],
              ),
              Container(
                height: height * 0.25,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 60,
                    )
                  ],
                ),
                child: Card(
                  elevation: 50,
                  color: const Color(0xFF1b1f2b),
                  shadowColor: Colors.black,
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: attendanceList.length,
                    itemBuilder: (BuildContext context, int index) {
                      AttendanceModel attendanceModel = attendanceList[index];
                      return getAttendanceCircularCard(attendanceModel);
                    },
                  ),
                ),
              ),
              Container(
                child: GridView.count(
                  //to disable scrolling in gridview
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  children: [
                    getColumn(Icons.person, 'Profile'),
                    getColumn(Icons.spellcheck, 'Attendance'),
                    getColumn(Icons.checklist, 'To Do'),
                    getColumn(Icons.access_time, 'Time Table'),
                    getColumn(Icons.menu_book, 'Syllabus'),
                    getColumn(Icons.library_books, 'Previous\nYear Papers'),
                    getColumn(Icons.bar_chart_rounded, 'Result'),
                    getColumn(Icons.book, 'Courses'),
                    Container(),
                    getColumn(Icons.night_shelter, 'Societies'),
                    getColumn(Icons.event_available, 'Events'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getAttendanceCircularCard(AttendanceModel attendanceModel) {
    return Column(
      children: [
        CircularArc(attendanceModel),
        Flexible(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(top: 5),
            width: 100,
            child: Text(
              attendanceModel.getCourseName(),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white, fontFamily: "Montserrat"),
            ),
          ),
        ),
        // const Text(
        //   "data",
        //   style: TextStyle(color: Colors.white, fontFamily: "Montserrat"),
        // ),
      ],
    );
  }
}

class CircularArc extends StatefulWidget {
  AttendanceModel attendanceModel;
  CircularArc(this.attendanceModel, {Key? key}) : super(key: key);

  @override
  State<CircularArc> createState() => _CircularArcState(attendanceModel);
}

class _CircularArcState extends State<CircularArc> {
  AttendanceModel attendanceModel;
  _CircularArcState(this.attendanceModel);

  @override
  Widget build(BuildContext context) {
    double attendance =
        attendanceModel.getClassesAttended() / attendanceModel.getClassesHeld();
    return SizedBox(
      width: 100,
      child: Stack(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: Text(
                '${(attendance * 100).truncate()}%',
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Montserrat",
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                attendanceModel.getCourseCode(),
                maxLines: 1,
                style: const TextStyle(
                    color: Colors.white, fontFamily: "Montserrat"),
              ),
            ),
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: CustomPaint(
              painter: ProgressArc(0.0, const Color(0xFFFFFFFF), false),
            ),
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: CustomPaint(
                painter: ProgressArc(
                    attendance, getColorForAttendance(attendance), false),
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
}

class ProgressArc extends CustomPainter {
  double attendance = 0.0;
  Color progressColor;
  bool isBackground;

  ProgressArc(this.attendance, this.progressColor, this.isBackground);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromPoints(
      Offset(size.width * 0.2, size.height * 0.2),
      Offset(size.width * 0.8, size.width * 0.8),
    );
    const startAngle = math.pi / 4;
    double sweepAngle = -(3 * math.pi / 2);
    if (progressColor == Color(0xFFEB5757) ||
        progressColor == Color(0xFF0ba485)) {
      sweepAngle = -((attendance * 3 * math.pi / 2));
    }
    const userCenter = false;
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawArc(rect, startAngle, sweepAngle, userCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

//0xFF1b1f2b
//pink - 0xFFfd426a
