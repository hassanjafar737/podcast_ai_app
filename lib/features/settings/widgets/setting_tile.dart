import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget{
  final IconData icon;
  final String title;
  final String subtitle;
  final String? badge;
  final VoidCallback onTap;
  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.badge,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context){
    final screenWidth= MediaQuery.of(context).size.width;
    final screenHeight= MediaQuery.of(context).size.height;
    return Material(
        color:Colors.transparent,
        child:InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          splashColor: Colors.white10,
          highlightColor: Colors.white10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04,
            vertical: screenHeight*
                0.013),
            decoration: BoxDecoration(
              color:const Color(0xff0B0F1A),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white10)
            ),
            child: Row(
              children: [
                Container(
              width:screenWidth*0.11,
              height:screenWidth*0.11,
              decoration:BoxDecoration(
                shape:BoxShape.circle,
                color:const Color(0xff1B1F2A),
              ),
              child:Icon(
                icon,
                color:Colors.white70,
                size:20,
              ),
            ),
            SizedBox(width:screenWidth*0.035),
             Expanded(child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   title,
                   style:TextStyle(
                     color:Colors.white,
                     fontWeight: FontWeight.w600,
                     fontSize: screenWidth*0.038,
                   ),
                 ),
                 SizedBox(height: screenHeight * 0.001,),
                 Text(
                   subtitle,
                   style:TextStyle(
                     color:Colors.white54,
                     fontWeight: FontWeight.w500,
                     fontSize: screenWidth*0.03,

                   ),

                 ),
               ],
             )),
                if(badge != null)
                  Container(margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.symmetric(horizontal:screenWidth*0.019,vertical:screenWidth*0.009),
                    decoration: BoxDecoration(
                      color: Color(0xff342C47),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(badge!,style:const TextStyle(
                      color:Color(0xffC2AFEF),
                      fontWeight: FontWeight.bold,
                      fontSize:10,
                    ),),
                  ),
                Icon(
                  Icons.chevron_right,
                  color:Colors.white24,
                  size:18,
                ),
              ],
            ),
        ),

        ));}}