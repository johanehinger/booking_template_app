import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
        return 'The account already exists for that email';
      }
      return "Something went wrong";
    } catch (error) {
      print(error.toString());
      return error.toString();
    }
  }

  Future<String> signOut() async {
    await FirebaseAuth.instance.signOut();
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
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return 'Something went wrong';
    } catch (error) {
      print(error.toString());
      return 'Something went wrong';
    }
  }
}
