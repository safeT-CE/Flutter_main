import 'package:flutter/material.dart';

class PenaltyPointPage extends StatelessWidget {
  const PenaltyPointPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('벌점 기록'),
      ),
      body: const Center(
        child: Text('벌점 기록 내용'),
      ),
    );
  }
}
