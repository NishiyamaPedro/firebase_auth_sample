import 'package:flutter/material.dart';

import 'package:firebase_auth_sample/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You're signed in!"),
            Text("UID: ${AuthState.of(context)!.auth!.user()!.uid}"),
            Text("Email: ${AuthState.of(context)!.auth!.user()!.email}"),
            ElevatedButton(
                onPressed: () {
                  AuthState.of(context)!.auth!.signOut();
                },
                child: Text("Log Out")),
          ],
        ),
      ),
    );
  }
}
