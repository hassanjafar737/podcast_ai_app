import 'package:flutter/material.dart';

class HeaderIcon extends StatelessWidget{
  final IconData icon;
  final VoidCallback onTap;
  const HeaderIcon({
    super.key,
    required this.icon,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context){
    return Material(
      color:Colors.transparent,
      child:InkWell(
        borderRadius:BorderRadius.circular(20),
        splashColor:Colors.white24,
        onTap:onTap,
        child:Padding(
          padding:const EdgeInsets.all(6),
          child:Icon(
            icon,
            color:Colors.white70,
            size:20,
          ),
        ),
      ),
    );
  }
}