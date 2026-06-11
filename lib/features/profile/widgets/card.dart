import 'package:flutter/material.dart';

class PremiumMemberCard extends StatelessWidget {
  final String image;

  const PremiumMemberCard({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(padding:EdgeInsets.all(25),child: Column(children: [ Stack(
      alignment: Alignment.bottomCenter,
        children: [

          Container(

            padding: EdgeInsets.all(screenWidth * 0.01),

            decoration: BoxDecoration(
              shape: BoxShape.circle,

              border: Border.all(
                color: const Color(0xff3B82F6),
                width: 3,
              ),

              boxShadow: [

                BoxShadow(
                  color: Color(0xff3B82F6).withOpacity(0.4),
                  blurRadius: 20,
                  spreadRadius: 2,
                )
              ],
            ),
            child: CircleAvatar(
              radius: screenWidth * 0.13,
              backgroundImage: AssetImage(image),
            ),
          ),
          Positioned(
          child:
          // SizedBox(height: screenHeight * 0.09),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.008,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: const LinearGradient(
                colors: [
                  Color(0xff8B5CF6),
                  Color(0xffA855F7),
                ],
              ),
            ),
            child: Text(
              "PREMIUM MEMBER",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: screenWidth * 0.028,
              ),
            ),
          ),

          )],
    ),
      SizedBox(height: 0.05,),
      Text("Alex Chen",style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        fontSize: screenWidth * 0.12,
      ),
      ),
      SizedBox(height: 0.05,),
      Text("Digital Audio Architect & VOX AI Pioneer",style: TextStyle(
        color: Colors.white,
        letterSpacing: 1,
        fontSize: screenWidth * 0.03,
      ),
      ),

    ])
    );
  }
}