import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingCard extends StatelessWidget{
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const SettingCard({super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
     return GestureDetector(
        onTap: onTap,
        child: Container(
            // margin: EdgeInsets.only(bottom: screenHeight * 0.025,),
          margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(screenWidth * 0.04,),
            decoration: BoxDecoration(
              color: const Color(0xff0F0F15),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(screenWidth * 0.025),
          decoration: BoxDecoration(

            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.05),
          ),
          child: Icon(
            icon,
           color: Color(0xffC4B5FD),
            size: screenWidth * 0.05,
          ),
        ),
       SizedBox(width: screenWidth * 0.04),
         Expanded(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 title,
                 style: TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.w600,
                   fontSize: screenWidth * 0.038,
                 ),
               ),
               // SizedBox(height: screenHeight *0.004,),
               Text(
                 subtitle,
                 style: TextStyle(
                   color: Colors.white54,
                   fontSize: screenWidth * 0.028,
                 ),
               ),
            ],
          ),
        ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white38,
                size: screenWidth * 0.04,
              ),
     ]))
     );

            }
}