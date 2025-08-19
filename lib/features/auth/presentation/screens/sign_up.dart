import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmony_hush/core/theme/app_colors.dart';
import 'package:harmony_hush/shared/widgets/buttons/primary_button.dart';
import 'package:harmony_hush/shared/widgets/inputs/harmony_inputs.dart';
import 'package:harmony_hush/shared/widgets/layouts/custom_back_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomBackButton(),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Create your Account',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textBrown,
              ),
            ),
            SizedBox(height: 20),
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
            SizedBox(height: 40),
            HarmonyInput(
              controller: TextEditingController(), 
              labelText: 'Name',
              hintText: 'Enter your name',
              type: InputType.text,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 40),
            HarmonyInput(
              controller: TextEditingController(), 
              labelText: 'Password',
              hintText: 'Enter your password',
              type: InputType.password,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: Row(
                children: [
                  Text('I have read the ', style: GoogleFonts.inter(color: AppColors.textgrey)),
                  Text('PRIVACY POLICY', style: GoogleFonts.inter(color: AppColors.inputText)),
                  Spacer(),
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                      side: BorderSide(color: AppColors.backgroundgreen, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 80),
            PrimaryButton(
            onPressed: () {
            //  log(  'Get Started button pressed');
            },
            label: 'SIGN UP',
            width: 320,
            height: 55,
           
          ),
          ],
        ),
      ),
    );
  }
}