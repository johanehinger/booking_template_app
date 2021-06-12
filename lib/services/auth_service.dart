import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  static Map<String, dynamic>? _parseJwt(String? token) {
    // validate token
    if (token == null) return null;
    final List<String> parts = token.split('.');
    if (parts.length != 3) {
      return null;
    }
    // retrieve token payload
    final String payload = parts[1];
    final String normalized = base64Url.normalize(payload);
    final String resp = utf8.decode(base64Url.decode(normalized));
    // convert to Map
    final payloadMap = json.decode(resp);
    if (payloadMap is! Map<String, dynamic>) {
      return null;
    }
    return payloadMap;
  }

  Future<String?> getUserRole(String uid) async {
    DocumentSnapshot user =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (user.exists) {
      return user['role'];
    }
  }

  Future<String> signInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      print(googleAuth);
      final credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      if (user != null) {
        Map<String, dynamic>? idMap = _parseJwt(credential.idToken!);

        FirebaseFirestore.instance.collection('users').doc(user.uid).set(
          {
            'email': user.email,
            'firstName': idMap!["given_name"],
            'lastName': idMap["family_name"],
            'role': 'user',
          },
          SetOptions(merge: true),
        );
        return 'Signed in successfully';
      }
      return "something went wrong";
    } catch (error) {
      return error.toString();
    }
  }

  /// registerWithEmailAndPassword
  ///   Will return either the newly created user as a "User" object or null
  Future<String> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String socialSecurityNumber,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      if (user != null) {
        FirebaseFirestore.instance.collection('users').doc(user.uid).set(
          {
            'email': email,
            'firstName': firstName,
            'lastName': lastName,
            'socialSecurityNumber': socialSecurityNumber,
            'role': 'user',
          },
          SetOptions(merge: true),
        );
        return 'User created successfully';
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
