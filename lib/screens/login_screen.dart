import 'package:flutter/material.dart';
import 'package:note_app/controllers/google_auth.dart';
import 'package:note_app/screens/login/page1.dart';
import 'package:note_app/screens/login/page2.dart';
import 'package:note_app/screens/login/page3.dart';
import 'package:note_app/screens/login/page4.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            const Positioned(
              top: 50,
              left: 50,
              right: 50,
              child: Text(
                'Simple Note',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 55,
                    fontFamily: 'SupermercadoOne',
                    fontWeight: FontWeight.bold,
                    color: Color(0xcc383838)),
              ),
            ),
            PageView(
              children: const [
                LgPage1(),
                LgPage2(),
                LgPage3(),
                LgPage4(),
              ],
            ),
            const Positioned(
              bottom: 20,
              left: 40,
              right: 40,
              child: SignInButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xff6C63FF),
      ),
      onPressed: () => signInWithGoogle(context),
      child: Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/google.png',
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(
              width: 20,
            ),
            const Text(
              'Continue With Google',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
