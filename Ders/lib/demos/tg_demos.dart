import 'package:flutter/material.dart';

class HomeX extends StatelessWidget {
  const HomeX({super.key});

  @override
  Widget build(BuildContext context) {
    return // Hourly 
// Component 
Scaffold(
  body: SizedBox(
    height: 100,
    width: 100,
    child: Column(
      children: [
        Stack(children: [
          
          // Hour 
          PositionedDirectional(
            top: 16,
            start: 8.5,
            child: 
                Text(
            "12 AM",
            style: const TextStyle(
                color:  Color(0xffffffff),
                fontWeight: FontWeight.w600,
                fontFamily: "SFProText",
                fontStyle:  FontStyle.normal,
                fontSize: 5.0
            ),
            textAlign: TextAlign.left                
            ),
          ),
          // Weather Icon 
          PositionedDirectional(
            top: 52,
            start: 8,
            child: 
                Stack(children: [
              // Label 
              PositionedDirectional(
                top: 22,
                start: 7,
                child: 
                    Text(
                "30%",
                style: const TextStyle(
                    color:  Color(0xff40cbd8),
                    fontWeight: FontWeight.w600,
                    fontFamily: "SFProText",
                    fontStyle:  FontStyle.normal,
                    fontSize: 4.3
                ),
                textAlign: TextAlign.center                
                ),
              ),
              // Big/Moon cloud mid rain 
              PositionedDirectional(
                top: -4,
                start: 6,
                child: 
                    // Moon cloud mid rain 
                SizedBox(
                  width: 10.666666666666666,
                  height: 10.666666666666666
                ),
              )
            ]),
          ),
          // Degre ° 
          PositionedDirectional(
            top: 106,
            start: 15,
            child: 
                Text(
            "19°",
            style: const TextStyle(
                color:  Color(0xffffffff),
                fontWeight: FontWeight.w400,
                fontFamily: "SFProDisplay",
                fontStyle:  FontStyle.normal,
                fontSize: 6.7
            ),
            textAlign: TextAlign.left                
            ),
          )
        ]),
      ],
    ),
  ),
);

}}