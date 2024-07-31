import 'package:flutter/material.dart';

import 'inquiry_page.dart';

class AskPage extends StatelessWidget {
  const AskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('문의하기'),
      ),
      body: InquiryPage(),
    );
  }
}
