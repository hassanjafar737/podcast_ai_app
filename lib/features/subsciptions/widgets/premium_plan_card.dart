import 'package:flutter/material.dart';

class PremiumPlanCard extends StatelessWidget{
  final String title;
  final String price;
  final String duration;
  final List<String> features;
  final bool recommended;
  final String buttonText;
  final VoidCallback onTap;
  const PremiumPlanCard({super.key,  required this.title,
  required this.price,
    required this.duration,
    required this.features,
    required this.recommended,
    required this.buttonText,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final screenWidth= MediaQuery.of(context).size.width;
    final screenHeight= MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(screenWidth *0.03),
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration:  BoxDecoration(color:  Color(0xff0B0F1A),
      borderRadius: BorderRadius.circular(28),
          boxShadow: [BoxShadow(color: Colors.white38,spreadRadius: 1,blurRadius: 1)],
        border: Border.all(color: Colors.white10)
      ),
      child: Stack(
         clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: recommended ?screenHeight *0.015:0,),
              Text(
                title,
                style:TextStyle(
                  color:Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth*0.06,
                ),
              ),
              SizedBox(height:6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:[
                  Text(
                    price,
                    style:TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth*0.10,
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.only(
                      left:4,
                      bottom: screenHeight*0.012,
                    ),
                    child:Text(
                      duration,
                      style:TextStyle(
                        color:Colors.white54,
                        fontSize: screenWidth*0.03,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height:screenHeight*0.03,),
              ...features.asMap().entries.map((entry){
                final index=entry.key;
                final feature=entry.value;
                return Padding(padding:EdgeInsets.only(
                  bottom: screenHeight*0.015,
                ),child: Row(
                  children: [
                    index==3 && !recommended
                    ? Icon(Icons.close,
                      color:Colors.white24,
                      size:18,):const Icon(
                      Icons.check_circle_outline,
                      color:Color(0xffA855F7),
                      size:18,
                    ),
                    SizedBox(width: screenWidth*0.03,),
                    Expanded(
                      child:Text(
                        feature,
                        style:TextStyle(
                          color:Colors.white70,
                          fontSize: screenWidth*0.03,
                        )
                      )
                    ),
                  ],
                ),
                );
              },
              ),
              SizedBox(height:screenHeight*0.03,
              ),
                   InkWell(
                borderRadius: BorderRadius.circular(30),
                splashColor:Colors.white24,
                onTap:onTap,
                child:Container(
                  width:double.infinity,
                  height:screenHeight*0.06,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color:recommended ?null :const Color(0xff111111),
                    gradient:recommended ?const LinearGradient(
                      colors:[
                        Color(0xff2563EB),
                        Color(0xffC084FC),
                      ],
                    )
                        :null,
                    border:Border.all(color:Colors.white10,
                    ),
                  ),
                  child:Center(
                    child:Text(
                      buttonText,
                      style:TextStyle(
                        color:Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth*0.032,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        if(recommended)
    Positioned(
        top:-screenHeight*0.024,
        right:-screenWidth*0.05,
      child:Container(
        padding: const EdgeInsets.symmetric(
          horizontal:19,
          vertical:5,
        ),
        decoration:const BoxDecoration(
          color:Color(0xffC084FC),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            bottomLeft: Radius.circular(18),
          ),
        ),
        child:Text(
          "RECOMMENDED",
          style:TextStyle(
            color:Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth*0.022,
      ),
    )
      )
                ),
               ] ),


    );
  }
}