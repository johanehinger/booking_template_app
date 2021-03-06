import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import './sign_up_screen.dart';
import '../services/auth_service.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String? email;
  String? password;
  String? response;
  final AuthService _authService = AuthService();

  final _formKey = GlobalKey<FormState>();
  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _authService.signInWithEmailAndPassword(
          context: context, email: email, password: password);
    }
  }

  void _forgotPassword() {
    print("Forgot password");
  }

  void _signUp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpScreen(),
      ),
    );
  }

  void _loginWithFacebook() {
    print("Login with Facebook");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: constraint.maxHeight, maxWidth: 500),
                // TODO: IntrinsicHeight is expensive, optimize this later.
                child: IntrinsicHeight(
                  child: Container(
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 24,
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 12.0,
                                        left: 12.0,
                                        right: 12.0,
                                      ),
                                      child: TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (val) => val!.isEmpty
                                            ? "Enter a email"
                                            : null,
                                        obscureText: false,
                                        onChanged: (val) => {this.email = val},
                                        decoration: InputDecoration(
                                          labelText: "Email",
                                          prefixIcon: Icon(Icons.email),
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
                                          setState(() => {password = val});
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Password",
                                          prefixIcon: Icon(Icons.lock),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: _forgotPassword,
                                child: const Text('Forgot password?'),
                              ),
                              Container(
                                width: 200.0,
                                height: 50.0,
                                child: ElevatedButton(
                                  onPressed: () => _login(context),
                                  child: const Text('Login'),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text("Have no account?"),
                                  TextButton(
                                    onPressed: _signUp,
                                    child: const Text('Sign up!'),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 35.0,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Expanded(child: const Divider()),
                                  Text("Sign in with"),
                                  const Expanded(
                                    child: const Divider(),
                                  ),
                                ],
                              ),
                              SignInButton(
                                Buttons.Google,
                                onPressed: () => _authService.signInWithGoogle(
                                  context: context,
                                ),
                              ),
                              SignInButton(
                                Buttons.Facebook,
                                onPressed: () => _loginWithFacebook(),
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
            ),
          );
        },
      ),
    );
  }
}
