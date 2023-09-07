import 'dart:async';
import 'package:flutter/material.dart';

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
      home: MyHomePage(),
    );
  }
}

// このアプリのメイン画面。
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 休憩時間（5分 = 300秒）
  int _brakeTime = 300;
  // 作業時間（25分 = 1500秒）
  int _workTime = 1500;
  // 現在の残り秒数
  int _current = 1500;
  // 今が作業時間かどうか（休憩時間ならfalse、作業時間ならtrue）
  bool _isWorkTime = false;
  // タイマーがスタートしているかどうか
  bool _isStart = true;
  // 画面上部に表示されるテキスト（ワークタイムかブレイクタイムか）
  String _titleText = "ワークタイム";
  late Timer _timer;

  @override
  // この関数は画面にどのように表示するかを決める部分。
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 17, 61),

      ///色の決定はもう少し後にする
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      _titleText,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'テスト',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              // 時間表示
              Container(
                child: Text(
                  formatTime(),
                  style: TextStyle(
                    fontSize: 130,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // ボタン
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.play_arrow,
                        color: Color.fromARGB(255, 0, 17, 61),
                      ),
                      onPressed: !_isStart
                          ? null
                          : () {
                              _isStart = false;
                              startTimer();
                            },
                    ),
                    SizedBox(width: 50),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      child: Icon(
                        ///後で、このアイコンを消して、スタートボタンと被せて使いたい
                        Icons.stop,
                        color: Color.fromARGB(255, 0, 17, 61),
                      ),
                      onPressed: _isStart
                          ? null
                          : () {
                              setState(() {
                                resetTimer();
                              });
                            },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 1秒ごとにonTimer関数を呼ぶタイマーを開始する関数。
  ///現状は、システムを持ってきているけど、余裕があれば、パッケージの方に切り替えたい。
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), onTimer);
  }

  // 残り時間を1秒ずつ減らす関数。時間が0になったら、作業時間と休憩時間を切り替える。
  void onTimer(Timer timer) {
    if (_current == 0) {
      setState(() {
        _isStart = true;
        _timer.cancel();
        if (_isWorkTime) {
          _current = _workTime;
          _isWorkTime = false;
          _titleText = "ワークタイム";
        } else {
          _current = _brakeTime;
          _isWorkTime = true;
          _titleText = "ブレイクタイム";
        }
      });
    } else {
      setState(() {
        _current--;
      });
    }
  }

  // 残り時間を分と秒の形式（例: "25:00"）に変換する関数。
  String formatTime() {
    final minutes = (_current / 60).floor().toString().padLeft(2, '0');
    final seconds = (_current % 60).floor().toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  // タイマーをリセットする関数。
  void resetTimer() {
    setState(() {
      _isStart = true;
      _timer.cancel();
      _current = _workTime;
      _isWorkTime = false;
      _titleText = "ワークタイム";
    });
  }
}
