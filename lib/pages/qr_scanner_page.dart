import 'package:flutter/material.dart';

class QrScannerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR 스캐너'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context, true); // 임의로 QR 코드 스캔 완료를 시뮬레이션
          },
          child: Text('QR 스캔 완료'),
        ),
      ),
    );
  }
}
