import 'package:bmicalculator/Models/constants.dart';
import 'package:flutter/material.dart';


class Results extends StatelessWidget {


 Results({@required this.bmiValue, @required this.bmiComment, @required this.bmiDescription});
  
final String bmiValue;
final String bmiComment;
final String bmiDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Results', style: TextStyle(
              fontFamily: 'Pacifico',
              color: Colors.pinkAccent,
              fontSize: 30.0,
            ),
          )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: 29.0,
            ),
            Text('YOUR RESULTS IS ', style: kResultLabel, ),
           Container(
      margin: EdgeInsets.all(15.0),
      height: 400.0,
      width: 380.0,
      decoration: BoxDecoration(
          color: kActiveCardColor,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
             bmiComment, 
              style: TextStyle(
              fontSize: 25.0,
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold
            ),
            ),
            Text(
              bmiValue,
              style: kNumberTextStyle,
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: Center(
                  child: Text(
               bmiDescription,
                textAlign: TextAlign.center,
              )),
            )
          ]),
    ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
                          child: Container(
                  width: 300.0,
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Center(
                      child: Text(
                    'RE-CALCULATE',
                    style: kLargeLabelTextStyle,
                  )),
                  height: kBottomContainerHeight,
                  margin: EdgeInsets.all(15.0)),
            ),
          ],
        ));
  }
}

