import 'package:flutter/material.dart';
import 'package:flutter_andomie/core.dart';
import 'package:flutter_app/feature/index.dart';

class SplashActivity extends StatelessWidget {
  static const String title = "Splash";
  static const String route = "splash";

  const SplashActivity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashView(
      title: "My App",
      subtitle: "Let's go we are looking something now",
      logo: "assets/images/logo.png",
      onRoute: (context) {
        return AuthHelper.isLoggedIn
            ? Navigator.pushReplacementNamed(
                context,
                HomeActivity.route,
                arguments: AuthHelper.uid,
              )
            : Navigator.pushReplacementNamed(
                context,
                AuthActivity.route,
                arguments: AuthFragmentType.signIn,
              );
      },
    );
  }
}
