class AttendanceModel {
  final String _courseCode;
  final String _courseName;
  final int _classesHeld;
  final int _attended;
  final int _totalClasses;

  AttendanceModel(this._courseCode, this._courseName, this._totalClasses,
      this._classesHeld, this._attended);

  String getCourseCode() {
    return _courseCode;
  }

  String getCourseName() {
    return _courseName;
  }

  int getClassesHeld() {
    return _classesHeld;
  }

  int getClassesAttended() {
    return _attended;
  }

  int getTotalClasses() {
    return _totalClasses;
  }
}
