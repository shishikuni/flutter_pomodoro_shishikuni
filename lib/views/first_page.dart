import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 163,
          height: 163,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: null
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
