import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InquiryData extends ChangeNotifier {
  final List<InquiryItem> _inquiries = [];

  List<InquiryItem> get inquiries => _inquiries;

  void addInquiry(String category, String title, String content, {String? fromPenaltyDate, String? imagePath}) {
    _inquiries.add(InquiryItem(
      category: category,
      title: title,
      content: content,
      date: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()),  // 날짜 형식 변경
      fromPenaltyDate: fromPenaltyDate,
      imagePath: imagePath,
    ));
    notifyListeners();
  }
}

class InquiryItem {
  final String category;
  final String title;
  final String content;
  final String date;
  final String? fromPenaltyDate;
  final String? imagePath;

  InquiryItem({
    required this.category,
    required this.title,
    required this.content,
    required this.date,
    this.fromPenaltyDate,
    this.imagePath,
  });
}
