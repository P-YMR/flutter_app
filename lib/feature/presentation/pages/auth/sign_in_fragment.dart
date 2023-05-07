import 'package:flutter/material.dart';

import '../../../../index.dart';

class AuthSignInFragment extends StatelessWidget {
  final AuthController controller;

  const AuthSignInFragment({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Sign in",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
