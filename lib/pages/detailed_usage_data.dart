import 'package:flutter/foundation.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class DetailedUsage {
  final String date;           // 이용 날짜
  final String driveTime;      // 주행 시간
  final double driveDistance;  // 주행 거리 (단위: km)
  final String imagePath;      // 이미지 경로
  final LatLng location;       // 위치 (위도, 경도)

  DetailedUsage({
    required this.date,
    required this.driveTime,
    required this.driveDistance,
    required this.imagePath,
    required this.location,
  });
}

class DetailedUsageData extends ChangeNotifier {
  List<DetailedUsage> _usages = [
    DetailedUsage(
      date: '2024-08-10',
      driveTime: '2시간 30분',
      driveDistance: 35.5,
      imagePath: 'assets/image/city_hall.png',
      location: LatLng(37.5665, 126.9780), // 서울시청 위치
    ),
    DetailedUsage(
      date: '2024-08-11',
      driveTime: '1시간 45분',
      driveDistance: 22.0,
      imagePath: 'assets/image/myungdong.png',
      location: LatLng(37.5651, 126.9895), // 명동 위치
    ),
    // 추가 이용 내역을 여기에 추가할 수 있습니다.
  ];

  List<DetailedUsage> get usages => _usages;

  void addUsage(DetailedUsage usage) {
    _usages.add(usage);
    notifyListeners();
  }
}
