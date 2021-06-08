import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      if (user != null) {
        return "Signed in successfully";
      }
      return "something went wrong";
    } catch (error) {
      return error.toString();
    }
  }

  /// registerWithEmailAndPassword
  ///   Will return either the newly created user as a "User" object or null
  Future<String> registerWithEmailAndPassword({
    String? email,
    String? password,
  }) async {
    try {
      if (email != null && password != null) {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);

        User? user = userCredential.user;
        if (user != null) {
          return 'User created successfully';
        }
      } else {
        throw Error();
      }
      return "Something went wrong";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        return 'The account with that email already exists';
      }
      return "Something went wrong";
    } catch (error) {
      print(error.toString());
      return error.toString();
    }
  }

  Future<String> signOut(context) async {
    await FirebaseAuth.instance.signOut();
    SnackBar snackBar = SnackBar(content: Text("hej"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    return "Signed out";
  }

  Future<String> signInWithEmailAndPassword(
      {String? email, String? password}) async {
    try {
      if (email != null && password != null) {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        User? user = userCredential.user;
        if (user != null) {
          return "Signed in successfully";
        }
      }
      return "Something went wrong";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found with that email';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password';
      }
      return 'Something went wrong';
    } catch (error) {
      print(error.toString());
      // return 'Something went wrong';
      return error.toString();
    }
  }
}
