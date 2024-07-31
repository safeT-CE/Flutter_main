import 'package:flutter/material.dart';

class InquiryData extends ChangeNotifier {
  final List<InquiryItem> _inquiries = [];

  List<InquiryItem> get inquiries => List.unmodifiable(_inquiries);

  void addInquiry(String category, String title, String content) {
    _inquiries.add(InquiryItem(category: category, title: title, content: content, date: DateTime.now().toString().split(' ')[0]));
    notifyListeners();
  }
}

class InquiryItem {
  final String category;
  final String title;
  final String content;
  final String date;

  InquiryItem({required this.category, required this.title, required this.content, required this.date});
}
