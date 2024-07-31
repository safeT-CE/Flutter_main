import 'package:flutter/material.dart';
import 'package:safet/pages/violation_data.dart';

import 'one_on_one_inquiry_page.dart';

class PenaltyDetailPage extends StatelessWidget {
  final ViolationItem violation;

  const PenaltyDetailPage({super.key, required this.violation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(violation.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('위반 날짜: ${violation.date}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Image.asset(violation.imagePath),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OneOnOneInquiryPage(
                      initialCategory: '벌점',  // 벌점 카테고리로 설정
                      initialTitle: violation.title,  // 벌점 항목 제목으로 설정
                    ),
                  ),
                );
              },
              child: const Text('문의하기'),
            ),
          ],
        ),
      ),
    );
  }
}
