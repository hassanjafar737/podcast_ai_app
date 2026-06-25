import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/core/services/auth_services.dart';
import 'package:podcast_ai_app/core/services/navigator/navigator.dart';
import 'package:podcast_ai_app/core/theme/app_colors.dart';
import 'package:podcast_ai_app/features/auth/screens/signup_screen.dart';
import 'package:podcast_ai_app/features/auth/widgets/auth_textfield.dart';
import 'package:podcast_ai_app/features/auth/widgets/gradient_button.dart';
import 'package:podcast_ai_app/features/auth/widgets/social_button.dart';
import 'package:podcast_ai_app/features/auth/widgets/auth_header.dart';
import 'package:podcast_ai_app/features/auth/widgets/auth_logo.dart';
import 'package:podcast_ai_app/features/home/screens/home_screen.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  bool isLoading = false;
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
                title: "Welcome Back",
                subtitle: "Enter your details to continue your AI journey",
              ),
              SizedBox(height: 40.h),
              SocialButton(
                image: "assets/images/searchgoogle.png",
                text: "Continue with Google",
                onTap: () {},
              ),
              SizedBox(height: 12.h),
              SocialButton(
                image: "assets/images/apple-logos.png",
                text: "Continue with Apple",
                onTap: () {},
              ),
              
              SizedBox(height: 32.h),

              Row(
                children: [
                  const Expanded(
                      child: Divider(
                          color: AppColors.border)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      "OR",
                      style: TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Expanded(
                      child: Divider(
                          color: AppColors.border)),
                ],
              ),
              
              SizedBox(height: 32.h),

              AuthTextfield(
                controller: emailController,
                hintText: "Email Address",
                icon: Icons.email_outlined,
                obscureText: false,
              ),
              SizedBox(height: 16.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AuthTextfield(
                    controller: passwController,
                    hintText: "Password",
                    icon: Icons.lock_outline,
                    obscureText: true,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: AppColors.accent,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 24.h),
              
              GradientButton(
                text: "GET STARTED",
                icon: Icons.arrow_forward_rounded,
                isLoading: isLoading,
                onPressed: _handleLogin,
              ),
              
              SizedBox(height: 32.h),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => AppRoutes.push(context, const SignupScreen()),
                    child: Text(
                      "Sign up",
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

  Future<void> _handleLogin() async {
    if (isLoading) return;
    
    final email = emailController.text.trim();
    final password = passwController.text.trim();
    
    if (email.isEmpty || password.isEmpty) {
      _showError("Please fill in all fields");
      return;
    }

    try {
      setState(() => isLoading = true);
      
      await AuthServices().login(email: email, password: password);
      
      if (!mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Successful")),
      );
      
      AppRoutes.pushReplacement(context, const HomeScreen());
      
    } on AppwriteException catch (e) {
      _showError(e.message ?? "Login Failed");
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
