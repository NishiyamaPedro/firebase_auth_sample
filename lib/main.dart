import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth_sample/auth.dart';
import 'package:firebase_auth_sample/home.dart';
import 'package:firebase_auth_sample/signin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthState(
      auth: Auth(),
      child: MaterialApp(
        title: 'firebase auth sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeController(),
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Auth? auth = AuthState.of(context)!.auth;

    return StreamBuilder(
      stream: auth?.authSate,
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? Home() : SignIn();
        }
        return Container(
          color: Colors.black,
        );
      },
    );
  }
}
