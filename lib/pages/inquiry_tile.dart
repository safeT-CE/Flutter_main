import 'package:flutter/material.dart';

class InquiryTile extends StatelessWidget {
  final String question;
  final String answer;
  final String date;

  InquiryTile({required this.question, required this.answer, required this.date});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(question),
      subtitle: Text(date),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(answer),
        ),
      ],
    );
  }
}
