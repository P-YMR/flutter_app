import 'package:flutter/material.dart';

import '../../../../index.dart';

class AuthSignUpFragment extends StatelessWidget {
  final AuthController controller;

  const AuthSignUpFragment({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Sign up",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
