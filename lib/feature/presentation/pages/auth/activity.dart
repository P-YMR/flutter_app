import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../index.dart';

class AuthActivity extends StatelessWidget {
  static const String route = "auth";
  static const String title = "Auth";
  final AuthFragmentType? type;

  const AuthActivity({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => di<AuthController>(),
        child: AuthFragment(
          type: type ?? AuthFragmentType.signIn,
        ),
      ),
    );
  }
}

enum AuthFragmentType {
  signIn,
  signUp,
  forgotPassword,
}
