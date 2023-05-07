import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../index.dart';

class AuthBody extends StatefulWidget {
  final AuthBodyType type;

  const AuthBody({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  State<AuthBody> createState() => _AuthBodyState();
}

class _AuthBodyState extends State<AuthBody> {
  late AuthController controller;

  @override
  void initState() {
    controller = context.read<AuthController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case AuthBodyType.signIn:
        return AuthSignInFragment(controller: controller);
      case AuthBodyType.signUp:
        return AuthSignUpFragment(controller: controller);
    }
  }
}

enum AuthBodyType {
  signIn,
  signUp,
}
