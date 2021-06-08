import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:social_influencer_template_app/screens/sign_up_screen.dart';
import 'package:social_influencer_template_app/widgets/text_input.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  void _login() {
    print("Login");
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

  void _loginWithGoogle() {
    print("Login with google");
  }

  void _loginWithFacebook() {
    print("Login with Facebook");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: const AssetImage('assets/auth_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "App title here",
                      style: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextInput(
                      icon: const Icon(
                        Icons.email,
                      ),
                      obscureText: false,
                      labelText: "Email",
                    ),
                    TextInput(
                      icon: const Icon(
                        Icons.lock,
                      ),
                      obscureText: true,
                      labelText: "Password",
                    ),
                    TextButton(
                        onPressed: _forgotPassword,
                        child: const Text('Forgot password?')),
                    Container(
                      width: 200.0,
                      height: 50.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        onPressed: _login,
                        child: const Text('Login'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Have no account?"),
                        TextButton(
                            onPressed: _signUp, child: const Text('Sign up!')),
                      ],
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        "Sign in with",
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
                    onPressed: () => _loginWithGoogle(),
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
    );
  }
}
