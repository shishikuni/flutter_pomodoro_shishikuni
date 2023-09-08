import 'package:flutter/material.dart';

class PurposeSettingPage extends StatelessWidget {
  const PurposeSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF007A82),
      body: Column(
        children: [
          Container(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 150),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 1),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                child: const Text(
                  '目的設定',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 50),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            width: 400,
            height: 200,
          )
        ],
      ),
    );
  }
}
