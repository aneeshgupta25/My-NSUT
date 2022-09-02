import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeTableRoute extends StatelessWidget {
  const TimeTableRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            color: Color(0xFF1b1f2b),
            child: const Center(
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
          ),
        ),
      ),
    );
  }
}
