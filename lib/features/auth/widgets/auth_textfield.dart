import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthTextfield extends StatelessWidget{
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;
  const AuthTextfield({required this.controller,required this.hintText,required this.icon,required this.obscureText});

  @override
  Widget build(BuildContext context) {


    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.07,
       width: screenWidth*0.75,
        decoration: BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.circular(screenWidth * 0.40),
        border: Border.all(color: Colors.white.withOpacity(0.08))
        ),
      child:  TextFormField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        obscureText: obscureText,  style: const TextStyle(
        color: Colors.black,
      ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black54,
            fontSize: screenWidth * 0.035,
          ),
          prefixIcon: Icon(icon,color:Colors.black54,),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: 0,
          ),
        ),

        ),
      );

  }
}