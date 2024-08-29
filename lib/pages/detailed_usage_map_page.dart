import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

import '../main.dart';
import 'detailed_usage_data.dart';

class DetailedUsageMapPage extends StatefulWidget {
  final DetailedUsage usage;

  DetailedUsageMapPage({required this.usage});

  @override
  _DetailedUsageMapPageState createState() => _DetailedUsageMapPageState();
}

class _DetailedUsageMapPageState extends State<DetailedUsageMapPage> {
  late KakaoMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상세 이용 지도'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: KakaoMap(
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        center: widget.usage.path.first, // 경로의 시작 지점을 중심으로 설정
        polylines: [
          Polyline(
            polylineId: 'route',
            points: widget.usage.path, // 경로에 사용할 좌표 리스트
            strokeColor: safeTgreen, // 경로 색상
            strokeWidth: 5, // 경로 두께
          ),
        ],
        markers: [
          Marker(
            markerId: 'start',
            latLng: widget.usage.path.first, // 경로 시작 지점
          ),
          Marker(
            markerId: 'end',
            latLng: widget.usage.path.last, // 경로 끝 지점
          ),
        ],
        maxLevel: 16, // 적절한 줌 레벨 설정
      ),
    );
  }
}
