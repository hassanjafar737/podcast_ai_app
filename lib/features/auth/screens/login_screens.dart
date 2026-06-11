import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/core/services/auth_services.dart';
import 'package:podcast_ai_app/core/services/navigator/navigator.dart';
import 'package:podcast_ai_app/features/auth/screens/signup_screen.dart';
import 'package:podcast_ai_app/features/auth/widgets/auth_textfield.dart';
import 'package:podcast_ai_app/features/auth/widgets/gradient_button.dart';
import 'package:podcast_ai_app/features/auth/widgets/social_button.dart';
import 'package:podcast_ai_app/features/home/screens/home_screen.dart';
class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}
class _LoginScreensState extends State<LoginScreens>{

  bool isLoading=false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Color(0xff050816),
     body: Center(
         child: SafeArea(
           child:Center(
             child: SingleChildScrollView(
               child:  Container(
           width: 340.w.clamp(300.0, 450.0),
           margin: EdgeInsets.symmetric(
             vertical: 20.h,
           ),
           padding: EdgeInsets.symmetric(
             horizontal: 24.w,
             vertical: 30.h,
           ),
             decoration: BoxDecoration(
               color: const Color(0xff0B0F1A),
               borderRadius: BorderRadius.circular(35.r),
               border: Border.all(
                 color: Colors.white10,
               ),
               boxShadow: [
                 BoxShadow(
                   color: Colors.black.withOpacity(0.4),
                   blurRadius: 40,
                   spreadRadius: 5
                 ),
               ],
             ),
     child:  Column(
         children: [
           Image.asset("assets/images/ai_podcast_logo.png",
             width: 80.w.clamp(60.0, 120.0),
             fit: BoxFit.contain,),
           SizedBox(height: 10.h,),
           Text(
             "VOX AI",
             style: TextStyle(
               color: Colors.blue.shade900,
               fontSize: 32.sp.clamp(24.0, 48.0),
               fontWeight: FontWeight.bold,
               letterSpacing: 2,
             ),
           ),
           SizedBox(height: 8.h,
           ),
           Text(
             "Welcome Back",
             style: TextStyle(
               color: Colors.white70,
               fontSize: 14.sp.clamp(12.0, 18.0),
               letterSpacing: 1.5,
             ),
           ),
           SizedBox(height: 30.h,),

           SocialButton(image: "assets/images/google.png", text:"Sign in with Google", onTap: (){}),
           SizedBox(height: 15.h,),
           SocialButton(image: "assets/images/apple-logo.png", text:"Sign in with Apple", onTap: (){}),
           SizedBox(height: 25.h,),
           Row(
             children: [
               const Expanded(child: Divider(color: Colors.white24)),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 10.w),
                 child: Text("OR", style: TextStyle(color: Colors.white24, fontSize: 12.sp.clamp(10.0, 14.0))),
               ),
               const Expanded(child: Divider(color: Colors.white24)),
             ],
           ),
           SizedBox(height: 25.h,),
           SizedBox(
             width: double.infinity,
             child: Text(
               "EMAIL ADDRESS",
               style: TextStyle(
                 color: Colors.white70,
                 fontWeight: FontWeight.bold,
                 fontSize: 11.sp.clamp(10.0, 14.0),
                 letterSpacing: 0.8,
               ),
             ),
           ),

           SizedBox(height: 10.h),

             AuthTextfield(hintText: "Enter the email...", icon: Icons.email, obscureText: false,controller: emailController,),

           SizedBox(height: 20.h),
           SizedBox(
             width: double.infinity,
                   child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
          Text("PASSWORD" ,style: TextStyle(
             color: Colors.white70,
             fontWeight: FontWeight.bold,
             fontSize: 11.sp.clamp(10.0, 14.0),
           ),),Text("FORGOT",style: TextStyle(
                 color: const Color(0xffC084FC),
                 fontWeight: FontWeight.w600,
                 fontSize: 11.sp.clamp(10.0, 14.0),
               ),)
             ],),
                 ),
           SizedBox(height: 10.h,),
           AuthTextfield(hintText: "Enter the password...", icon: Icons.lock_outline, obscureText: true,controller: passwController,),
           SizedBox(height: 40.h,),
           GradientButton(text: isLoading ? "PLEASE WAIT..." : "GET STARTED", icon:Icons.arrow_forward,onPressed: ()async{
             if (isLoading) return;
             
             try{
               setState(() {
                 isLoading=true;
               });
               
               await AuthServices().login(
                 email: emailController.text.trim(), 
                 password: passwController.text.trim()
               );
               
               if(!mounted) return;
               
               ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(
                   content:Text("Login Successful"),
                 ),
               );
               
                   AppRoutes.pushReplacement(
                 context, 
                 const HomeScreen()
               );
               
             }on AppwriteException catch(e) {
               ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                   content: Text(e.message ?? "Login Failed"),
                 ),
               );
            } catch(e) {
               ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(
                   content: Text("An unexpected error occurred"),
                 ),
               );
            } finally {
               if (mounted) {
                 setState(() {
                   isLoading = false;
                 });
               }
             }
           }),
           SizedBox(height: 25.h,),

           Column(
             children: [
               Text(
                 "Don't have an account?",
                 style: TextStyle(
                   color: Colors.white54,

                   fontSize: 12.sp.clamp(10.0, 14.0),
                 ),
               ),

               SizedBox(height: 5.h),
               GestureDetector(
                 onTap: () {
                   AppRoutes.push(context, const SignupScreen());

                 },
                 child: Text(
                   "Sign up for free",
                   style: TextStyle(
                     color: const Color(0xffC084FC),
                     fontWeight: FontWeight.bold,
                     fontSize: 13.sp.clamp(11.0, 15.0),
                   ),
                 ),
               ),
             ],
           ),
           SizedBox(height: 30.h,),
           Row(

             mainAxisAlignment:
             MainAxisAlignment.spaceBetween,
             children: [
               footerText(
                 "PRIVACY POLICY",
               ),
               footerText(
                 "TERMS OF SERVICE",
               ),
               footerText(
                 "HELP CENTER",
               ),
             ],
           ),
         ],
     ),
           ),
       )),

)));
  }
  Widget footerText(
      String text){
    return Text(
      text,
      style: TextStyle(
        color: Colors.white24,
        fontSize: 8.sp.clamp(7.0, 10.0),
      ),
    );
  }
}


