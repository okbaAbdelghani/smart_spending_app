

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return    Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 0.05 * MediaQuery.of(context).size.width,
                ),
          child:Column(
            children: [
              Container(
                height: 200,

                  child: ProfileInfo()
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(24))
                ),
                child: Column(
                  children: [


                       ProfileMenu(),

                  ],
                ),
              ),
            ],
          )
    )
    );

  }
}
class ProfileInfo extends StatelessWidget {
  const ProfileInfo ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                   Container(
                    padding: EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color:  Color.fromRGBO(173, 0, 255, 1),
                          width: 1.0),
                      ),
                      child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/profile.jpg"),
                      radius: 40,
                      ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        width: 100,

                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                            children: [

                              Text(
                                "username",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14.0,
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Okba",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                        ),
                      ),




                Expanded(
                    child: SvgPicture.asset("assets/icons/edit-icon.svg",
                    width: 40,),
                )
            ],
            ),
          ),
        );

  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
          
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 0.2,
                  )
                )
            ),
              child:
              Padding(
            padding: EdgeInsets.symmetric(
            horizontal: 0.04 * MediaQuery.of(context).size.width,
            ),
                child: Row(
                  children: [
                    ProfileMenuStyle(),
                    SvgPicture.asset("assets/icons/account_icon.svg",),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Account",
                        style: TextStyle(
                            fontFamily: 'inter',
                            fontSize: 16,

                        ),
                      ),
                    )
                  ],
                ),
              ),
          ),

          Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.2,
                      )
                  )
              ),
            child:
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.04 * MediaQuery.of(context).size.width,
              ),
              child: Row(
                children: [
                  ProfileMenuStyle(),
                   SvgPicture.asset("assets/icons/settings.svg",),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Settings",
                      style: TextStyle(
                          fontFamily: 'inter',
                          fontSize: 16
                      ),),
                  )
                ],
              ),
            ),
          ),

          Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.2,
                      )
                  )
              ),
            child:
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.04 * MediaQuery.of(context).size.width,
              ),
              child: Row(
                children: [
                  ProfileMenuStyle(),
                  SvgPicture.asset("assets/icons/export_data.svg"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Export Data",
                      style: TextStyle(
                          fontFamily: 'inter',
                          fontSize: 16
                      ),),
                  )
                ],
              ),
            ),
          ),

          Container(

            child:
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.04 * MediaQuery.of(context).size.width,
              ),
              child: Row(
                children: [
                  ProfileMenuStyle(),
                  SvgPicture.asset("assets/icons/logout.svg"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Logout",
                      style: TextStyle(
                          fontFamily: 'inter',
                          fontSize: 16
                      ),),
                  )
                ],
              ),
            ),
          ),

        ],
    );

  }
}
class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Divider(
          height: 5, //height spacing of divider
          thickness: 1, //thickness of divier line
        )
    );
  }
}

class ProfileMenuStyle extends StatelessWidget {
  const ProfileMenuStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 80,

    );
  }
}




