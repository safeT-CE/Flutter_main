import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'inquiry_data.dart';

class PersonalInquiryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inquiryData = Provider.of<InquiryData>(context);

    return ListView.builder(
      itemCount: inquiryData.inquiries.length,
      itemBuilder: (context, index) {
        final inquiry = inquiryData.inquiries[index];
        return Card(
          child: ListTile(
            title: Text(inquiry.title),
            subtitle: Text(inquiry.date),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InquiryDetailPage(inquiry: inquiry),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class InquiryDetailPage extends StatelessWidget {
  final InquiryItem inquiry;

  const InquiryDetailPage({super.key, required this.inquiry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(inquiry.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('문의 날짜: ${inquiry.date}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Text('문의 분류: ${inquiry.category}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Text('문의 내용: ${inquiry.content}', style: const TextStyle(fontSize: 18)),
            if (inquiry.fromPenaltyDate != null) ...[
              const SizedBox(height: 20),
              Text('관련 벌점 날짜: ${inquiry.fromPenaltyDate}', style: const TextStyle(fontSize: 18)),
            ],
            if (inquiry.imagePath != null) ...[
              const SizedBox(height: 20),
              Image.asset(inquiry.imagePath!),
            ],
          ],
        ),
      ),
    );
  }
}
