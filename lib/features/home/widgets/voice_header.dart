import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VoiceHeader extends StatelessWidget{
  const VoiceHeader({ super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return  Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 15,
              child:
              Image.asset(
                "assets/images/trending1.png",
                width: screenWidth * 0.70,
              ),

            ),
            SizedBox(width: screenWidth *0.02,),
            Text(
              "VOX AI",
              style: TextStyle(
                color: Colors.blue.shade900,
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(width: screenWidth *0.5,),
            InkWell(
              onTap: (){},
              child: Icon(Icons.notifications,color: Colors.white,),
            )
          ],
        ),
        Divider(),
      Padding(padding: EdgeInsets.all(12),
      child:
        Text(
          "Select your voice",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.07,
            letterSpacing: 4,
          ),
        ),
    ),
         // SizedBox(height: screenHeight * 0.001),
    Padding(padding: EdgeInsets.all(12),
    child:
        Text(
          "Find the perfect AI personality for your podcast",
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.04,
            // fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        )
    )

      ],

    );

  }}