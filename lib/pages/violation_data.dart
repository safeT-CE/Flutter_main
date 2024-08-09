import 'package:flutter/material.dart';

class ViolationData extends ChangeNotifier {
  final List<ViolationItem> _violations = [
    ViolationItem(
      title: '횡단보도위반',
      date: '2024-07-01',
      time: 'PM 04:10 - 05:00\n1시간 이용', 
      location: '덕성여자대학교 인근', 
      imagePath: 'assets/image/frame_261.jpg',
      mapImagePath: 'assets/image/seoul_map.png', 
      count: 3, 
    ),
    //항목추가
  ];

  List<ViolationItem> get violations => _violations;
}
class ViolationItem {
  final String title;
  final String date;
  final String time;
  final String location; 
  final String imagePath;
  final String mapImagePath;
  final int count; 

  ViolationItem({
    required this.title,
    required this.date,
    required this.time, 
    required this.location,
    required this.imagePath,
    required this.mapImagePath,
    required this.count, 
  });
}