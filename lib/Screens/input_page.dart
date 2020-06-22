import 'resultsBMI.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/Widgets/reusable_card.dart';
import 'package:bmicalculator/Widgets/gender_card.dart';
import 'package:bmicalculator/Models/constants.dart';
import 'package:bmicalculator/Widgets/roundIconButton.dart';
import 'package:bmicalculator/Models/calculator_brain.dart';


enum EnumGender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  EnumGender genderSelected;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Beemy', style: TextStyle(
          fontFamily: 'Pacifico',
          color: Colors.pinkAccent,
          fontSize: 30.0,
        ),)),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  onpressed: () {
                    setState(() {
                      genderSelected = EnumGender.male;
                    });
                  },
                  colour: genderSelected == EnumGender.male
                      ? kActiveCardColor
                      : kInactiveCardColour,
                  childCard: GenderCard(
                    genderIcon: FontAwesomeIcons.male,
                    gender: 'MALE',
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  onpressed: () {
                    setState(() {
                      genderSelected = EnumGender.female;
                    });
                  },
                  childCard: GenderCard(
                    genderIcon: FontAwesomeIcons.female,
                    gender: 'FEMALE',
                  ),
                  colour: genderSelected == EnumGender.female
                      ? kActiveCardColor
                      : kInactiveCardColour,
                )),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: kNumberTextStyle),
                      Text(
                        'CM',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 50,
                      max: 300,
                      activeColor: Colors.pinkAccent,
                      inactiveColor: Colors.grey,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                ]),
            colour: kActiveCardColor,
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(weight.toString(), style: kNumberTextStyle),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              tapped: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                tapped: () {
                                  setState(() {
                                    weight++;
                                  });
                                })
                          ])
                    ]),
                colour: kActiveCardColor,
              )),
              Expanded(
                  child: ReusableCard(
                colour: kActiveCardColor,
                childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            tapped: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            tapped: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ]),
              ))
            ],
          )),
          GestureDetector(
            onTap: () {
             
             CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) => Results(

                bmiValue: calc.calculateBMI(),
                bmiComment: calc.bmiResult(),
                bmiDescription: calc.bmiDescription(),
              )
                
              ));
            },
            child: Container(
              width: 300.0,
              decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Center(child: Text('CALCULATE', style: kLargeLabelTextStyle ,)),
              height: kBottomContainerHeight,
              margin: EdgeInsets.all(15.0)
            ),
          )
        ],
      ),
    );
  }
}
