import '../model/attendance_model.dart';

class AttendanceData {
  final List<AttendanceModel> _list = [
    AttendanceModel('CEECS06', 'Design and Analysis of Algorithms', 20, 11, 9),
    AttendanceModel(
        'CEECS07', 'Computer Architecture & Organization', 21, 10, 6),
    AttendanceModel('CEECS06', 'Web Technology', 20, 10, 9),
    AttendanceModel('CEECS06', 'Database Management System', 22, 12, 9),
    AttendanceModel(
        'CEECS06', 'Microprocessors and Microcontrollers', 23, 13, 9),
  ];

  List<AttendanceModel> getAttendanceList() {
    return _list;
  }
}
