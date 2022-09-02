import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_iosd/data/profile_data.dart';
import 'package:my_iosd/model/profile_model.dart';

class ProfileRoute extends StatefulWidget {
  const ProfileRoute({Key? key}) : super(key: key);

  @override
  State<ProfileRoute> createState() => _ProfileRouteState();
}

class _ProfileRouteState extends State<ProfileRoute> {
  ProfileData data = ProfileData();
  late List<ProfileModel> list;

  @override
  Widget build(BuildContext context) {
    list = data.getProfileData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Theme(
          data: ThemeData(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFfd426a)),
          ),
          child: Scaffold(
            backgroundColor: Color(0xFF1b1f2b),
            body: Column(
              children: [
                const Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 59,
                        backgroundImage: AssetImage('images/aneesh.jpeg'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color(0xFF1b1f2b),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, index) {
                        return getProfileCard(list[index]);
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

  Widget getProfileCard(ProfileModel model) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(boxShadow: []),
      child: Card(
        elevation: 30,
        shadowColor: Colors.black,
        margin: const EdgeInsets.only(left: 5, right: 5, top: 15),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            model.title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                letterSpacing: 0.6),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            model.content,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
