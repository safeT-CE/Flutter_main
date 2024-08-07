import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'inquiry_data.dart';
import 'inquiry_tile.dart';

class PersonalInquiryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inquiries = Provider.of<InquiryData>(context).inquiries;

    return Container(
      color: safeTgreen,
      child: ListView.builder(
        itemCount: inquiries.length,
        itemBuilder: (context, index) {
          final inquiry = inquiries[index];
          return InquiryTile(
            question: inquiry.title,
            answer: inquiry.content,
            date: inquiry.date,
            image: inquiry.imagePath != null ? Image.asset(inquiry.imagePath!) : null,
          );
        },
      ),
    );
  }
}
