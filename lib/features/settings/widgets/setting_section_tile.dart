import 'package:flutter/cupertino.dart';

class SettingsSectionTitle extends StatelessWidget{
  final String title;
  const SettingsSectionTitle({
    super.key,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(padding: EdgeInsets.only(bottom: 12),
    child:  Text(title, style:TextStyle(
      color:const Color(0xffC084FC),
      fontWeight:FontWeight.bold,
      letterSpacing:1.2,
      fontSize:screenWidth*0.025,
    ),),
    );
    
  }}