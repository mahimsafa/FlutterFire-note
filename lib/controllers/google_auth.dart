import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:note_app/screens/home_screen.dart';
import 'package:note_app/screens/login_screen.dart';

GoogleSignIn googleSignIn = GoogleSignIn();

final FirebaseAuth auth = FirebaseAuth.instance;
CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<bool> signInWithGoogle(BuildContext context) async {
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount == null) {
      return false;
    }

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await auth.signInWithCredential(credential);

    final User? user = authResult.user;

    var userData = {
      'name': googleSignInAccount.displayName,
      'email': googleSignInAccount.email,
      'photoUrl': googleSignInAccount.photoUrl,
      'id': googleSignInAccount.id,
      'provider': 'google',
    };

    users.doc(user?.uid).get().then((doc) {
      if (doc.exists) {
        doc.reference.update(userData);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        users.doc(user?.uid).set(userData);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
    });
  } catch (e) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => Text(e.toString())),
    );
  }

  return true;
}

void signOutGoogle(context) async {
  await FirebaseAuth.instance.signOut().then(
        (value) => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        ),
      );
}
