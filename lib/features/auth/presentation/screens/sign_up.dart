import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool isChecked = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;
    if (!isChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please agree to the Privacy Policy')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      await userCredential.user?.updateDisplayName(_nameController.text.trim());
      // Send email verification
      await userCredential.user?.sendEmailVerification();
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Verification email sent. Please check your inbox.')),
      // );
      context.go('/welcome'); // Navigate even if unverified (adjust as needed)
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'The email address is already in use.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is invalid.';
          break;
        case 'weak-password':
          errorMessage = 'The password is too weak.';
          break;
        default:
          errorMessage = 'An error occurred. Please try again.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error occurred.')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomBackButton(
                      onPressed: () {
                        context.go('/onboard');
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Create your Account',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textBrown,
                  ),
                ),
                SizedBox(height: 40),
                PrimaryButton(
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('assets/img/facebook.png'),
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  label: 'CONTINUE WITH FACEBOOK',
                  width: 360,
                  height: 60,
                ),
                SizedBox(height: 20),
                PrimaryButton(
                  borderColor: Colors.green,
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('assets/img/google.png'),
                      width: 32,
                      height: 32,
                      fit: BoxFit.contain,
                    ),
                  ),
                  onPressed: () {},
                  label: 'CONTINUE WITH GOOGLE',
                  width: 360,
                  height: 60,
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 30),
                Text(
                  'OR SIGN UP WITH EMAIL',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textgrey,
                  ),
                ),
                SizedBox(height: 20),
                HarmonyInput(
                  controller: _emailController,
                //  topLabel: 'Email address',
                  hintText: 'Enter your email',
                  type: InputType.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                HarmonyInput(
                  controller: _nameController,
               //   topLabel: 'Name',
                  hintText: 'Enter your name',
                  type: InputType.text,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    if (value.length < 2) {
                      return 'Name must be at least 2 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                HarmonyInput(
                  controller: _passwordController,
                 // topLabel: 'Password',
                  hintText: 'Enter your password',
                  type: InputType.password,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 20),
                HarmonyInput(
                  controller: _confirmPasswordController,
                //  topLabel: 'Confirm Password',
                  hintText: 'Confirm your password',
                  type: InputType.password,
                  confirmAgainst: _passwordController,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
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
                            }
                            
                            );
                          },
                          side: BorderSide(color: AppColors.backgroundgreen, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          fillColor: WidgetStateProperty.resolveWith<Color?>(
                          (Set<WidgetState> states) {
                            if (states.contains(WidgetState.selected)) {
                              return Colors.black; // Color when checked
                            }
                            return AppColors.transparent; // Color when unchecked
                          },),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                PrimaryButton(
                  onPressed: _isLoading ? null : _signUp,
                  label: _isLoading ? 'SIGNING UP...' : 'SIGN UP',
                  width: 360,
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}