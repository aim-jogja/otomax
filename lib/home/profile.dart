import 'package:flutter/material.dart';
import 'package:otomax/theme.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
            child: Text('Profile',
            style: blackTextStyle.copyWith(
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: GestureDetector(
                onTap: (() {
                  print("object");
                }),
                child: Text('Whislist (0)',
                          style: blackTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text('Feedback',
            style: greyTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text('Email us!',
            style: blackTextStyle.copyWith(
                  fontSize: 15,
                ),
              ),
            )
          ],
        )
        ),
      ),
    );
  }
}