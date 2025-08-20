import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmony_hush/core/theme/app_colors.dart';
import 'package:harmony_hush/shared/widgets/buttons/primary_button.dart';
import 'package:harmony_hush/shared/widgets/inputs/harmony_inputs.dart';
import 'package:harmony_hush/shared/widgets/layouts/custom_back_button.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomBackButton(
                     onPressed: () {
                    context.go('/onboard'); // GoRouter: go back to previous screen
                  },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textBrown,
                ),
              ),
              SizedBox(height: 40),
              PrimaryButton(
                icon: Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Image(
                      image: AssetImage('assets/img/facebook.png'),
                      width: 10,
                      height: 10,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                onPressed: () {},
                label: 'CONTINUE WITH FACEBOOK',
                width: 335,
                height: 55,
              ),
              SizedBox(height: 20),
              PrimaryButton(
                borderColor: Colors.green,
                icon: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Image(
                    image: AssetImage('assets/img/google.png'),
                    width: 24,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
                ),
                onPressed: () {},
                label: 'CONTINUE WITH GOOGLE',
                width: 335,
                height: 65,
                backgroundColor: Colors.white, // Button background white
              ),
              SizedBox(height: 30),
              Text('OR SIGN UP WITH EMAIL',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textgrey,
                  )),
              SizedBox(height: 20),
              HarmonyInput(
                controller: TextEditingController(), 
                labelText: 'Email address',
                hintText: 'Enter your email',
                type: InputType.email,
                keyboardType: TextInputType.emailAddress,
              ),
              
              SizedBox(height: 20),
              HarmonyInput(
                controller: TextEditingController(), 
                labelText: 'Password',
                hintText: 'Enter your password',
                type: InputType.password,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20),
             
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text('forgot Password?',style: GoogleFonts.inter(fontSize: 12,color:AppColors.textgrey),),
        )
              ],),
              SizedBox(height: 40),
              PrimaryButton(
              onPressed: () {
                
              //  log(  'Get Started button pressed');
              },
              label: 'SIGN IN',
              width: 360,
              height: 60,
             
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('If you dont\' have an account?',style: GoogleFonts.inter(fontSize: 14,color: AppColors.textgrey
            ),
            ),
            GestureDetector(
               onTap: () {
                  context.go('/signUp'); // Navigate to sign in page
                },
              child: Text('SIGN UP',style: GoogleFonts.inter(fontSize: 14,color: AppColors.inputText),))],)
            ],
          ),
        ),
      ),
    );
  }
}