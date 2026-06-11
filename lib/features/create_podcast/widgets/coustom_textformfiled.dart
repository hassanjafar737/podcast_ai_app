import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoustomTextformfiled extends StatelessWidget{
  final String label;
  final String hintText;
  final int maxLines;
  final bool isOutlineField;
  final TextEditingController controller;
  const CoustomTextformfiled({required this.controller,required this.hintText,
    required this.isOutlineField,required this.label, required this.maxLines,super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
   return  Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Text(label,style: TextStyle(
         color:  Color(0xffC084FC),
         fontSize: screenWidth * 0.028,
         fontWeight: FontWeight.bold,
         letterSpacing: 1,
       ),),
       SizedBox(height: screenHeight* 0.010),
       Container(

         height: isOutlineField?screenHeight * 0.18:
           screenHeight *0.07,
         decoration: BoxDecoration(
           color: isOutlineField ?const Color(0xff0B0F1A):Colors.white,
           borderRadius: BorderRadius.circular(isOutlineField?22:40),
    border: isOutlineField?Border.all(width :1.4,color: Color(0xff2563EB)):null

         ),
       child: TextFormField(
         maxLines: maxLines,
         controller: controller,
         style: TextStyle(color: isOutlineField
             ? Colors.white
             : Colors.black,
           fontSize: screenWidth * 0.035,),
         textAlignVertical: TextAlignVertical.center,
         decoration: InputDecoration(
           hintText: hintText,
           border: InputBorder.none,
           hintStyle: TextStyle(
             color: isOutlineField
                 ? Colors.white30
                 : Colors.black26,
             fontSize: screenWidth * 0.035,
           ),
           contentPadding:
           isOutlineField
               ? EdgeInsets.all(
             screenWidth * 0.045,
           )
               : EdgeInsets.symmetric(
             horizontal: screenWidth * 0.05,
             vertical: screenHeight * 0.022,
           ),
         ),
       ),

       )
     ],

   );
  }

}