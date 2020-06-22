import 'package:flutter/material.dart';
import 'package:bmicalculator/Models/constants.dart';




class GenderCard extends StatelessWidget {
  GenderCard({this.gender, this.genderIcon});

  final String gender;
  final IconData genderIcon;

 

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(genderIcon, size: 80.0, color: Colors.white,  ),
        SizedBox(
          height: 15.0,
        ),
        Text(gender, style: kLabelTextStyle),
      ],
    );
  }
}