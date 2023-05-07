import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../index.dart';

typedef AuthCreateHandler = Function(AuthData data);
typedef AuthForgotHandler = Function(AuthData data);

typedef AuthSignInHandler = Function(AuthData data);
typedef AuthSignUpHandler = Function(AuthData data);

class AuthFragment extends StatefulWidget {
  final AuthFragmentType type;

  const AuthFragment({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  State<AuthFragment> createState() => _AuthFragmentState();
}

class _AuthFragmentState extends State<AuthFragment> {
  late AuthController controller;

  @override
  void initState() {
    controller = context.read<AuthController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case AuthFragmentType.signIn:
        return AuthSignInFragment(
          onSignIn: controller.signIn,
          onCreateAccount: (data) => Navigator.pushNamed(
            context,
            AuthActivity.route,
            arguments: AuthFragmentType.signUp,
          ),
          onForgetPassword: (data) => Navigator.pushNamed(
            context,
            AuthActivity.route,
            arguments: AuthFragmentType.forgotPassword,
          ),
        );
      case AuthFragmentType.signUp:
        return AuthSignUpFragment(
          onSignUp: controller.signUp,
          onSignIn: (data) => Navigator.pop(context, data),
        );
      case AuthFragmentType.forgotPassword:
        return AuthForgotPasswordFragment(
          onForgot: controller.forgot,
        );
    }
  }
}
