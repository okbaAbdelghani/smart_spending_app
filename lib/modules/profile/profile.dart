import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kMinInteractiveDimension),
            child: AppBar(
              backgroundColor: Colors.transparent,
            )),
        body: const SingleChildScrollView(child: Text('trnsactions')));
  }
}