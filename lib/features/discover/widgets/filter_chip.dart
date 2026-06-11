import 'package:flutter/material.dart';

class FilterChipWidget extends StatelessWidget{
  final String text;
  final bool active;
  const FilterChipWidget({
    super.key,
    required this.text,
    required this.active,
  });
  @override
  Widget build(BuildContext context){
    return Container(
      margin:const EdgeInsets.only(right:10),
      padding:const EdgeInsets.symmetric(
        horizontal:14,
      ),
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(30),
        color:active
            ?const Color(0xffD8B4FE)
            :const Color(0xff0B0F1A),
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
            fontSize:11,
          ),

        ),

      ),

    );
  }
}