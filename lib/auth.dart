import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get authSate => _auth.authStateChanges();

  Future<void> signIn(String email, String password) async {
    _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUp(email, password) async {
    _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    _auth.signOut();
  }

  User? user() {
    return _auth.currentUser;
  }
}

class AuthState extends InheritedWidget {
  final Auth? auth;

  AuthState({
    Key? key,
    Widget? child,
    this.auth,
  }) : super(key: key, child: child!);

  @override
  bool updateShouldNotify(InheritedWidget oldWiddget) => true;

  static AuthState? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AuthState>();
}
