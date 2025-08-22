import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmony_hush/core/theme/app_colors.dart';
import 'package:harmony_hush/shared/widgets/buttons/primary_button.dart';
import 'package:harmony_hush/shared/widgets/inputs/harmony_inputs.dart';
import 'package:harmony_hush/shared/widgets/layouts/custom_back_button.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      context.go('/welcome');
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found with this email.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is invalid.';
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

  Future<void> _resetPassword() async {
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter your email to reset password.')),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset email sent.')),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'The email address is invalid.';
          break;
        case 'user-not-found':
          errorMessage = 'No user found with this email.';
          break;
        default:
          errorMessage = 'An error occurred. Please try again.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SingleChildScrollView(
        child: SafeArea(
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
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 30),
                Text(
                  'OR SIGN IN WITH EMAIL',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textgrey,
                  ),
                ),
                SizedBox(height: 20),
                HarmonyInput(
                  controller: _emailController,
                  labelText: 'Email address',
                  hintText: 'Enter your email',
                  type: InputType.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                HarmonyInput(
                  controller: _passwordController,
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
                      child: GestureDetector(
                        onTap: _resetPassword,
                        child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.inter(fontSize: 12, color: AppColors.textgrey),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                PrimaryButton(
                  onPressed: _isLoading ? null : _signIn,
                  label: _isLoading ? 'SIGNING IN...' : 'SIGN IN',
                  width: 360,
                  height: 60,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "If you don't have an account? ",
                      style: GoogleFonts.inter(fontSize: 14, color: AppColors.textgrey),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go('/signUp');
                      },
                      child: Text(
                        'SIGN UP',
                        style: GoogleFonts.inter(fontSize: 14, color: AppColors.inputText),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}