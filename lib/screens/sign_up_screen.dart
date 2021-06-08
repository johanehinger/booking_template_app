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
  DateTime selectedDate = DateTime.now();
  String? email;
  String? password;
  String? repeatPassword;
  String? response;

  final AuthService _authService = AuthService();

  final _formKey = GlobalKey<FormState>();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1930, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _signUpWithEmailAndPassword() async {
    if (_formKey.currentState!.validate()) {
      response = await _authService.registerWithEmailAndPassword(
          email: email, password: password);
      var _snackBar = SnackBar(
        content: Text(response ?? 'Something went wrong'),
      );
      ScaffoldMessenger.of(context).showSnackBar(_snackBar);
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pop(context);
      }
    }
  }

  Future<void> _signUpwithGoogle() async {
    response = await _authService.signInWithGoogle();
    var _snackBar = SnackBar(
      content: Text(response ?? 'Something went wrong'),
    );
    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.pop(context);
    }
  }

  void _signUpWithFacebook() {
    print("Sign up with Facebook");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign up"),
        ),
        body: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
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
                                  validator: (val) => val!.isEmpty
                                      ? "Enter a first name"
                                      : null,
                                  obscureText: false,
                                  onChanged: (val) {
                                    setState(() => {firstName = val});
                                  },
                                  decoration: InputDecoration(
                                    labelText: "First name",
                                    prefixIcon: Icon(Icons.perm_identity),
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
                                  validator: (val) =>
                                      val!.isEmpty ? "Enter a last name" : null,
                                  obscureText: false,
                                  onChanged: (val) {
                                    setState(() => {lastName = val});
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Last name",
                                    prefixIcon: Icon(Icons.perm_identity),
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
                                child: Container(
                                  width: double.infinity,
                                  height: 65.0,
                                  child: TextButton(
                                    onPressed: () => _selectDate(context),
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          side: const BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Icon(
                                          Icons.date_range,
                                          color: Colors.grey[600],
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          "Birthdate: " +
                                              "${selectedDate.toLocal()}"
                                                  .split(' ')[0],
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
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
                                  validator: (val) {
                                    if (val == null || val.length < 6) {
                                      return "Password must be a least 6 characters long";
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(() => {password = val});
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
                                  validator: (val) {
                                    if (val == null || val != password) {
                                      return "Passwords must be the same";
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(() => {repeatPassword = val});
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
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () =>
                                      _signUpWithEmailAndPassword(),
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
                                  child: const Divider(
                                    indent: 12.0,
                                    endIndent: 12.0,
                                  ),
                                ),
                                Text(
                                  "Or sign up with",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                                const Expanded(
                                  child: const Divider(
                                    indent: 12.0,
                                    endIndent: 12.0,
                                  ),
                                ),
                              ],
                            ),
                            SignInButton(
                              Buttons.Google,
                              onPressed: () => _signUpwithGoogle(),
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
            );
          },
        ));
  }
}
