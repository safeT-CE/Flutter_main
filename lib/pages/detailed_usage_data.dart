import 'package:flutter/foundation.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class DetailedUsage {
  final String date;           // 이용 날짜
  final String driveTime;      // 주행 시간
  final double driveDistance;  // 주행 거리 (단위: km)
  final String imagePath;      // 이미지 경로
  final List<LatLng> path;     // 이동 경로 (여러 위치 저장)

  DetailedUsage({
    required this.date,
    required this.driveTime,
    required this.driveDistance,
    required this.imagePath,
    required this.path, // 경로 초기화
  });
}

class DetailedUsageData extends ChangeNotifier {
  List<DetailedUsage> _usages = [
    DetailedUsage(
      date: '2024-08-10',
      driveTime: '2시간 30분',
      driveDistance: 35.5,
      imagePath: 'assets/image/city_hall.png',
      path: [
        LatLng(37.5665, 126.9780), // 서울시청 위치
        LatLng(37.5670, 126.9790), // 경로 중간 지점
        LatLng(37.5680, 126.9800), // 경로 중간 지점
      ],
    ),
    DetailedUsage(
      date: '2024-08-11',
      driveTime: '1시간 45분',
      driveDistance: 22.0,
      imagePath: 'assets/image/myungdong.png',
      path: [
        LatLng(37.5651, 126.9895), // 명동 위치
        LatLng(37.5645, 126.9880), // 경로 중간 지점
        LatLng(37.5630, 126.9865), // 경로 중간 지점
      ],
    ),
  ];

  List<DetailedUsage> get usages => _usages;

  void addUsage(DetailedUsage usage) {
    _usages.add(usage);
    notifyListeners();
  }
}
