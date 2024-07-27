import 'package:flutter/material.dart';

import 'inquiry_tile.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InquiryTile(
          question: '킥보드 대여는 어떻게 하나요?',
          answer: '킥보드 대여는 회원 가입 후 가능합니다.',
          date: '2024-06-10',
        ),
        InquiryTile(
          question: '대여는 몇시간동안 가능한가요?',
          answer: '대여는 연속 최대 4시간까지 가능합니다.',
          date: '2024-06-10',
        ),
        // 추가적인 문의 항목을 여기에 추가합니다.
      ],
    );
  }
}
