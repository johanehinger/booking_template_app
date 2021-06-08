import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:social_influencer_template_app/widgets/text_input.dart';
import 'dart:async';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  DateTime selectedDate = DateTime.now();
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

  void _signUpWithEmailAndPassword() {
    print("Sign up with email and password");
  }

  void _signUpwithGoogle() {
    print("Sign up with Google");
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            TextInput(
              icon: const Icon(
                Icons.perm_identity,
              ),
              labelText: "First name",
              obscureText: false,
            ),
            TextInput(
              icon: const Icon(
                Icons.perm_identity,
              ),
              labelText: "Last name",
              obscureText: false,
            ),
            Container(
              width: double.infinity,
              height: 65.0,
              padding: const EdgeInsets.only(
                top: 12.0,
                left: 12.0,
                right: 12.0,
              ),
              child: TextButton(
                onPressed: () => _selectDate(context),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
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
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextInput(
              icon: const Icon(
                Icons.email,
              ),
              labelText: "Email",
              obscureText: false,
            ),
            TextInput(
              icon: const Icon(
                Icons.lock,
              ),
              labelText: "Password",
              obscureText: true,
            ),
            TextInput(
              icon: const Icon(
                Icons.lock,
              ),
              labelText: "Repeat password",
              obscureText: true,
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              width: 200.0,
              height: 50.0,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                onPressed: () => _signUpWithEmailAndPassword(),
                child: const Text('Sign up'),
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
                        style: TextStyle(color: Theme.of(context).primaryColor),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
