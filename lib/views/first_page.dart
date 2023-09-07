import 'package:flutter/material.dart';

import '../timer.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // アプリのタイトルを設定して、MyHomePageをホーム画面として表示する。
    return MaterialApp(
      title: 'Flutter Pomodoro',
      home: MyHomePage(),
    );
  }
}
