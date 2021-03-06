import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'dart:async';
import '../services/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? firstName;
  String? lastName;
  String? socialSecurityNumber;
  String? email;
  String? password;
  String? repeatPassword;
  String? response;

  final AuthService _authService = AuthService();

  final _formKey = GlobalKey<FormState>();

  Future<void> _signUpwithGoogle({required BuildContext context}) async {
    await _authService.signInWithGoogle(context: context);

    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.pop(context);
    }
  }

  Future<void> _signUpWithEmailAndPassword(
      {required BuildContext context}) async {
    if (_formKey.currentState!.validate()) {
      await _authService.registerWithEmailAndPassword(
        context: context,
        email: email!,
        password: password!,
        firstName: firstName!,
        lastName: lastName!,
        socialSecurityNumber: socialSecurityNumber!,
      );
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pop(context);
      }
    }
  }

  void _signUpWithFacebook() {
    print("Sign up with Facebook");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: constraint.maxHeight, maxWidth: 500),
                // TODO: IntrinsicHeight is expensive, optimize this later.
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 24,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12.0,
                                  left: 12.0,
                                  right: 12.0,
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  validator: (val) => val!.isEmpty
                                      ? "Enter a first name"
                                      : null,
                                  obscureText: false,
                                  onChanged: (val) {
                                    setState(
                                      () => {firstName = val},
                                    );
                                  },
                                  decoration: InputDecoration(
                                    labelText: "First name",
                                    prefixIcon: Icon(Icons.perm_identity),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12.0,
                                  left: 12.0,
                                  right: 12.0,
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  validator: (val) =>
                                      val!.isEmpty ? "Enter a last name" : null,
                                  obscureText: false,
                                  onChanged: (val) {
                                    setState(
                                      () => {lastName = val},
                                    );
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Last name",
                                    prefixIcon: Icon(Icons.perm_identity),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12.0,
                                  left: 12.0,
                                  right: 12.0,
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  validator: (val) => val!.isEmpty
                                      ? "Enter a social security number"
                                      : null,
                                  obscureText: false,
                                  onChanged: (val) {
                                    setState(
                                      () => {socialSecurityNumber = val},
                                    );
                                  },
                                  decoration: InputDecoration(
                                    labelText: "social security number",
                                    prefixIcon: Icon(Icons.tag),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12.0,
                                  left: 12.0,
                                  right: 12.0,
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (val) =>
                                      val!.isEmpty ? "Enter a email" : null,
                                  obscureText: false,
                                  onChanged: (val) => {this.email = val},
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    prefixIcon: Icon(Icons.email),
                                    border: const OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12.0,
                                  left: 12.0,
                                  right: 12.0,
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  validator: (val) {
                                    if (val == null || val.length < 6) {
                                      return "Password must be a least 6 characters long";
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(
                                      () => {password = val},
                                    );
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    prefixIcon: Icon(Icons.lock),
                                    border: const OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12.0,
                                  left: 12.0,
                                  right: 12.0,
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  validator: (val) {
                                    if (val == null || val != password) {
                                      return "Passwords must be the same";
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(
                                      () => {repeatPassword = val},
                                    );
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Repeat password",
                                    prefixIcon: Icon(Icons.lock),
                                    border: const OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Container(
                                width: 200.0,
                                height: 50.0,
                                child: ElevatedButton(
                                  onPressed: () => _signUpWithEmailAndPassword(
                                    context: context,
                                  ),
                                  child: const Text('Sign up'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child: const Divider(),
                                ),
                                Text("Sign up with"),
                                const Expanded(
                                  child: const Divider(),
                                ),
                              ],
                            ),
                            SignInButton(
                              Buttons.Google,
                              onPressed: () =>
                                  _signUpwithGoogle(context: context),
                              text: "Sign up with Google",
                            ),
                            SignInButton(
                              Buttons.Facebook,
                              onPressed: () => _signUpWithFacebook(),
                              text: "Sign up with Facebook",
                            ),
                            const SizedBox(
                              height: 24,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
