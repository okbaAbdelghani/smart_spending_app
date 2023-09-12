import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.fromLTRB(20, 50, 10, 0),
      child:
          Container(
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
          ),


    ));
  }
}
