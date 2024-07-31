import 'package:flutter/material.dart';

class ViolationItem {
  final String title;
  final String date;
  final String location;
  final String description;
  final String imagePath;

  ViolationItem({
    required this.title,
    required this.date,
    required this.location,
    required this.description,
    required this.imagePath,
  });
}

class ViolationData with ChangeNotifier {
  final List<ViolationItem> _violations = [];

  List<ViolationItem> get violations => List.unmodifiable(_violations);

  void initializeData() {
    _violations.addAll([
      ViolationItem(
        title: '2인 이상 탑승',
        date: '2023-04-01',
        location: '덕성여자대학교 인근',
        description: '1시간 이용, 누적 3회',
        imagePath: 'assets/image/frame_261.jpg',
      ),
      // 다른 위반 사항 추가 가능
    ]);
    notifyListeners();
  }
}
