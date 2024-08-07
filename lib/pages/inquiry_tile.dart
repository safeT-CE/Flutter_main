import 'package:flutter/material.dart';

class InquiryTile extends StatelessWidget {
  final String question;
  final String answer;
  final String date;
  final Widget? image;

  InquiryTile({
    required this.question,
  required this.answer,
  required this.date,
  required this.image
  });

 @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(question),
      subtitle: Text(date),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(answer),
              if (image != null) ...[
                SizedBox(height: 8.0),
                image!,
              ]
            ],
          ),
        ),
      ],
    );
  }
}