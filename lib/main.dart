import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_pomodoro_shishikuni/timer.dart';
import 'package:flutter_pomodoro_shishikuni/views/first_page.dart';
import 'package:flutter_pomodoro_shishikuni/views/purpose_setting_page.dart';

// アプリを起動するときに最初に呼ばれる関数。
void main() {
  runApp(MyApp());
}

// アプリの基本設定を行う部分。
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // アプリのタイトルを設定して、MyHomePageをホーム画面として表示する。
    return MaterialApp(
      title: 'Flutter Pomodoro',
      home: FirstPage(),
    );
  }
}


// このアプリのメイン画面。
