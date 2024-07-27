import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'inquiry_data.dart';
import 'inquiry_tile.dart';

class PersonalInquiryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<InquiryData>(
      builder: (context, inquiryData, child) {
        return ListView.builder(
          itemCount: inquiryData.inquiries.length,
          itemBuilder: (context, index) {
            final inquiry = inquiryData.inquiries[index];
            return InquiryTile(
              question: inquiry.title,
              answer: inquiry.content,
              date: inquiry.date,
            );
          },
        );
      },
    );
  }
}
