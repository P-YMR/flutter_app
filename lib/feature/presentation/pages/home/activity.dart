import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../index.dart';

class HomeActivity extends StatelessWidget {
  static const String route = "home";
  static const String title = "Home";

  const HomeActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => di<HomeController>(),
        child: const HomeBody(
          type: HomeBodyType.initial,
        ),
      ),
    );
  }
}
