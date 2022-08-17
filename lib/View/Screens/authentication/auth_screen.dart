import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import '../../Widgets/auth/authentication_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitForm(String email, String userName, String password, bool isLogin,
      BuildContext ctx) async {
    UserCredential authResponse;
    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        authResponse = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResponse = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await FirebaseFirestore.instance
            .collection('GameMasters')
            .doc(authResponse.user!.uid)
            .set({
          'userName': userName,
          'email': email,
        });
      }
    } on PlatformException catch (err) {
      String? message = 'An error has occured, please check your credentials';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('Assets/Images/homeBackground.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AuthenticationForm(_submitForm, _isLoading),
      ),
    );
  }
}
