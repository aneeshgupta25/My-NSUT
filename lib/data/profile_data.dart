import '../model/profile_model.dart';

class ProfileData {
  final List<ProfileModel> _list = [
    ProfileModel('Student Name', 'ANEESH GUPTA'),
    ProfileModel('Student ID', '2021UCS1720'),
    ProfileModel('DOB', '25-01-2002'),
    ProfileModel('Branch Name', 'COMPUTER SCIENCE AND ENGINEERING'),
    ProfileModel('Section', '3'),
    ProfileModel('Gender', 'MALE'),
    ProfileModel('Specialization', 'COMPUTER SCIENCE AND ENGINEERING'),
    ProfileModel('Category', 'GN'),
    ProfileModel('Admission', 'Admission'),
    ProfileModel('Degree', 'B.Tech.'),
    ProfileModel('FT/PT', 'FULL TIME')
  ];

  List<ProfileModel> getProfileData() {
    return _list;
  }
}
