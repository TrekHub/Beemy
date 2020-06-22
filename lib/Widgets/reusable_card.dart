import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.childCard, this.onpressed});

  final Color colour;
  final Widget childCard;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
           onTap: onpressed,
          child: Container(
        child: childCard,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }
}