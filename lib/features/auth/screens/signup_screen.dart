import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/core/services/auth_services.dart';
import 'package:podcast_ai_app/core/services/navigator/navigator.dart';
import 'package:podcast_ai_app/core/theme/app_colors.dart';
import 'package:podcast_ai_app/features/auth/screens/login_screens.dart';
import 'package:podcast_ai_app/features/auth/widgets/auth_textfield.dart';
import 'package:podcast_ai_app/features/auth/widgets/gradient_button.dart';
import 'package:podcast_ai_app/features/auth/widgets/auth_header.dart';
import 'package:podcast_ai_app/features/auth/widgets/auth_logo.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              const AuthLogo(),
              SizedBox(height: 40.h),
              const AuthHeader(
                title: "Create Account",
                subtitle: "Join the future of AI-powered podcasting",
              ),
              SizedBox(height: 40.h),
              
              AuthTextfield(
                controller: nameController,
                hintText: "Full Name",
                icon: Icons.person_outline,
                obscureText: false,
              ),
              SizedBox(height: 16.h),
              AuthTextfield(
                controller: emailController,
                hintText: "Email Address",
                icon: Icons.email_outlined,
                obscureText: false,
              ),
              SizedBox(height: 16.h),
              AuthTextfield(
                controller: passwordController,
                hintText: "Password",
                icon: Icons.lock_outline,
                obscureText: true,
              ),
              
              SizedBox(height: 32.h),
              
              GradientButton(
                text: "CREATE ACCOUNT",
                icon: Icons.arrow_forward_rounded,
                isLoading: isLoading,
                onPressed: _handleSignup,
              ),
              
              SizedBox(height: 32.h),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ? ",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => AppRoutes.push(context, const LoginScreens()),
                    child: Text(
                      "Sign in",
                      style: TextStyle(

                        color: AppColors.accent,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 60.h),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _footerLink("PRIVACY"),
                  _footerLink("TERMS"),
                  _footerLink("HELP"),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _footerLink(String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.textMuted,
        fontSize: 11.sp,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    );
  }

  Future<void> _handleSignup() async {
    if (isLoading) return;
    
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showError("Please fill in all fields");
      return;
    }

    try {
      setState(() => isLoading = true);
      
      await AuthServices().signup(
        name: name,
        email: email,
        password: password,
      );
      
      if (!mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Signup Successful")),
      );
      
      AppRoutes.pushReplacement(context, const LoginScreens());
      
    } on AppwriteException catch (e) {
      _showError(e.message ?? "Signup Failed");
    } catch (e) {
      _showError("An unexpected error occurred");
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
      ),
    );
  }
}
