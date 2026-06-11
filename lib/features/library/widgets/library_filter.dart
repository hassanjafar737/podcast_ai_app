import 'package:flutter/material.dart';

class LibraryFilterChip extends StatelessWidget{
  final String text;
  final bool active;
  final VoidCallback onTap;
  const LibraryFilterChip({
    super.key,
    required this.text,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context){
    final screenWidth= MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap:onTap,
      child:Container(
        margin:const EdgeInsets.only(right:10),
        padding:const EdgeInsets.symmetric(horizontal:18),
        decoration:BoxDecoration(
          borderRadius:BorderRadius.circular(30),
          color:active ?const Color(0xffD8B4FE)
              :const Color(0xff161616),
          border:Border.all(
            color:Colors.white10,
          ),
        ),
        child:Center(
          child:Text(
            text,
            style:TextStyle(
              color:active
                  ?Colors.black
                  :Colors.white70,
              fontWeight:FontWeight.w600,
              fontSize:screenWidth*0.028,
            ),
          ),
        ),
      ),
    );
  }
}