import 'package:flutter/material.dart';

import '../../../../index.dart';

class HomeFragment extends StatelessWidget {
  final HomeController controller;

  const HomeFragment({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        HomeActivity.title,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
