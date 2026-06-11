import 'package:flutter/material.dart';

class AppRoutes{

  static Future push(BuildContext context, Widget screen, {int? currentIndex, int? targetIndex}){
    return Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds:400),
        reverseTransitionDuration: const Duration(milliseconds:350),
        pageBuilder:
            (_,animation,__){
          return screen;
        },
        transitionsBuilder:
            (_,animation,__ ,child){
          
          Offset begin = const Offset(1.0, 0.0); // Default: Right to Left
          
          if (currentIndex != null && targetIndex != null) {
            if (targetIndex < currentIndex) {
              // Agar target chota hai (piche ja rahe hain), toh Left se aaye
              begin = const Offset(-1.0, 0.0);
            }
          }

          const end= Offset.zero;
          const curve= Curves.easeInOutCubic;
          final tween=Tween(
            begin:begin,
            end:end,
          ).chain(
            CurveTween(curve:curve),
          );
          return SlideTransition(
            position: animation.drive(tween),
            child:child,

          );

        },

      ),

    );

  }

  static Future pushReplacement(BuildContext context, Widget screen){
    return Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds:400),
        reverseTransitionDuration: const Duration(milliseconds:350),
        pageBuilder:
            (_,animation,__){
          return screen;
        },
        transitionsBuilder:
            (_,animation,__ ,child){
          const begin= Offset(1.0,0.0);
          const end= Offset.zero;
          const curve= Curves.easeInOutCubic;
          final tween=Tween(
            begin:begin,
            end:end,
          ).chain(
            CurveTween(curve:curve),
          );
          return SlideTransition(
            position: animation.drive(tween),
            child:child,

          );

        },

      ),

    );

  }
}