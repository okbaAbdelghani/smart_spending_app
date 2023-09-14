//import 'dart:js_util';

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
    return   Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 50, 10, 0),
          child:Column(
            children: [
              ProfileInfo(),
              SizedBox(height: 50,),
              Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    ProfileMenu(),

                  ],
              )
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
    return Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: const Color.fromRGBO(173, 0, 255, 1),
                        width: 1.0),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                    radius: 40,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  width: 100,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
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
              ),
              Expanded(
                  child: Icon(
                    Icons.edit_outlined,
                    weight: 20,
                  ))
            ],
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
        
        Expanded(
            child:
            Row(
              children: [

                SvgPicture.asset("assets/icons/account_icon.svg"),

                Text("Account",
                  style: TextStyle(
                      fontFamily: 'inter',
                      fontSize: 16
                  ),)
              ],
            ),
        ),
        MyDivider(),
        Expanded(
          child:
          Row(
            children: [
              SvgPicture.asset("assets/icons/settings.svg"),


              Text("Settings",
                style: TextStyle(
                    fontFamily: 'inter',
                    fontSize: 16
                ),)
            ],
          ),
        ),
        MyDivider(),
        Expanded(
          child:
          Row(
            children: [
              SvgPicture.asset("assets/icons/export_data.svg"),
              Text("Export Data",
                style: TextStyle(
                    fontFamily: 'inter',
                    fontSize: 16
                ),)
            ],
          ),
        ),
        MyDivider(),
        Expanded(
          child:
          Row(
            children: [
              SvgPicture.asset("assets/icons/logout.svg"),


              Text("Logout",
                style: TextStyle(
                    fontFamily: 'inter',
                    fontSize: 16
                ),)
            ],
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
          thickness: 3, //thickness of divier line
          indent: 25, //spacing at the start of divider
          endIndent: 25, //spacing at the end of divider
        )
    );
  }
}



