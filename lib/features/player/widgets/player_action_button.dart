import 'package:flutter/material.dart';

class PlayerActionButton extends StatelessWidget{

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const PlayerActionButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context){

    final screenWidth=MediaQuery.of(context).size.width;

    return Material(
      color:Colors.transparent,
      child:InkWell(
        borderRadius:BorderRadius.circular(18),
        splashColor:Colors.white10,
        highlightColor:Colors.white10,
        onTap:onTap,
        child:Padding(
          padding:const EdgeInsets.symmetric(horizontal:10,vertical:6),
          child:Column(
            mainAxisSize:MainAxisSize.min,
            children:[
              Icon(icon,color:Colors.white70,size:20),
              SizedBox(height:6),
              Text(title,style:TextStyle(color:Colors.white54,fontSize:screenWidth*0.022,fontWeight:FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}