import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  // Google Sign In

  signWithGoogle() async {
    // beign interactive sign up process
   final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();


    // obtain auth details from request

    // craete a new credential for user

    //finally lets sign in
  }
}