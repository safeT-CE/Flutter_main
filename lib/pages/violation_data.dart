import 'package:flutter/material.dart';

class ViolationData extends ChangeNotifier {
  final List<ViolationItem> _violations = [
    ViolationItem(
      title: '횡단보도위반',
      date: '2024-07-01',
      imagePath: 'assets/image/frame_261.jpg',
    ),
    // 다른 위반 항목을 여기에 추가할 수 있습니다.
  ];

  List<ViolationItem> get violations => _violations;
}

class ViolationItem {
  final String title;
  final String date;
  final String imagePath;

  ViolationItem({
    required this.title,
    required this.date,
    required this.imagePath,
  });
}
