import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(),
          child: Column(
            children: [Text("Login Screen")],
          ),
        ),
      ),
    );
  }
}
