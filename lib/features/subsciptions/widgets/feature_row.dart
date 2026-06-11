
import 'package:flutter/material.dart';
class FeatureRow extends StatelessWidget{
  final String title;
  final String freePlan;
  final String proPlan;
  const FeatureRow({
    super.key,
    required this.title,
    required this.freePlan,
    required this.proPlan,
  });

  @override
  Widget build(BuildContext context){
    final screenWidth= MediaQuery.of(context).size.width;
    return Padding(
           padding: EdgeInsets.all(12),
        child:Row(
            children:[
              Expanded(flex:2,
                  child:Text(title,  style:TextStyle(
                    color:Colors.white,
                    fontSize:screenWidth*0.03,
                  ),) ),
              Expanded(
                  child: Text(freePlan,textAlign: TextAlign.center,
                    style:TextStyle(
                color:Colors.white,
                fontSize:screenWidth*0.028,
              ),)),
              Expanded(
                child:Text(
                  proPlan,
                  textAlign:TextAlign.center,
                  style:TextStyle(
                    color: Color(0xffC084FC),
                    fontWeight:FontWeight.bold,
                    fontSize:screenWidth*0.028,
                  ),
                ),

              ),


              ]));}}