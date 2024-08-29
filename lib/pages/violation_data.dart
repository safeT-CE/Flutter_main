import 'package:flutter/material.dart';

class ViolationData extends ChangeNotifier {
  final List<ViolationItem> _violations = [
    ViolationItem(
      title: '횡단보도위반',
      date: '2024-07-08',
      time: 'PM 04:10 - 05:00\n1시간 이용',
      location: '명동역 인근',
      imagePath: 'assets/image/cross.png',
      mapImagePath: 'assets/image/myungdong.png',
      count: 3,
      latitude: 37.5600,
      longitude: 126.9860,
    ),
      
    ViolationItem(
      title: '2인이상 탑승 위반',
      date: '2024-07-02',
      time: 'AM 08:30 - 09:00\n30분 이용',
      location: '고속터미널역 인근',
      imagePath: 'assets/image/two.png',
      mapImagePath: 'assets/image/seoul_map2.png',
      count: 2,
      latitude: 37.5048,
      longitude: 127.0049,
    ),

    ViolationItem(
      title: '헬멧착용위반',
      date: '2024-07-01',
      time: 'PM 04:10 - 05:00\n1시간 이용',
      location: '서울역 인근',
      imagePath: 'assets/image/no_helmet.png',
      mapImagePath: 'assets/image/seoul_map.png',
      count: 1,
      latitude: 37.5563,
      longitude: 126.9723,
    ),
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
  final double latitude; // 위도
  final double longitude; // 경도

  ViolationItem({
    required this.title,
    required this.date,
    required this.time, 
    required this.location,
    required this.imagePath,
    required this.mapImagePath,
    required this.count,
    required this.latitude, // 위도 초기화
    required this.longitude, // 경도 초기화
  });
}
