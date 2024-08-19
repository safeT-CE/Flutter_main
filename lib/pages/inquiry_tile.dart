import 'package:flutter/material.dart';

import '../main.dart';

class InquiryTile extends StatelessWidget {
  final String question;
  final String answer;
  final String date;
  final Widget? image;

  InquiryTile({
    required this.question,
    required this.answer,
    required this.date,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(
          color: safeTblack, 
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        date,
        style: TextStyle(
          color: Colors.black, 
        ),
      ),
      iconColor: safeTlightgreen, 
      collapsedIconColor: safeTlightgreen, 
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
            shape: Border(
        top: BorderSide(color: Colors.white),
        bottom: BorderSide(color: safeTlightgreen),
      ),
      collapsedShape: Border(
        top: BorderSide(color: Colors.white),
        bottom: BorderSide(color: safeTlightgreen),
      ),
    );
  }
}
