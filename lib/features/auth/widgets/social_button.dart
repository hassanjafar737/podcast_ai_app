import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialButton extends StatelessWidget {
  // final IconData icon;
  final String image;
  final String text;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * 0.07,
        width: width*0.7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(width * 0.45),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: ListTile(
          leading: Image.asset(image,fit: BoxFit.cover,width: 26,),
      //   leading: FaIcon(
      //   icon,
      //   color: Colors.orange,
      //   size: width * 0.05,
      // ),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: width * 0.047,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
      ),
    );
  }
}