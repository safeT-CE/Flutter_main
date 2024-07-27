import 'package:flutter/material.dart';

class NumberInputPage extends StatefulWidget {
  final VoidCallback onNumberEntered;

  NumberInputPage({required this.onNumberEntered});

  @override
  _NumberInputPageState createState() => _NumberInputPageState();
}

class _NumberInputPageState extends State<NumberInputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('번호 입력'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '번호를 입력하세요',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                widget.onNumberEntered();
              },
              child: Text('확인'),
            ),
          ],
        ),
      ),
    );
  }
}
