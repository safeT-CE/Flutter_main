import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:safet/main.dart';

import 'detailed_usage_data.dart';

class DetailedUsageMapPage extends StatefulWidget {
  final DetailedUsage usage;

  DetailedUsageMapPage({required this.usage});

  @override
  _DetailedUsageMapPageState createState() => _DetailedUsageMapPageState();
}

class _DetailedUsageMapPageState extends State<DetailedUsageMapPage> {
  late KakaoMapController mapController;
  Set<Marker> markers = {};  // 마커들을 저장할 변수

  @override
  void initState() {
    super.initState();
    _setMarker();  // 초기화 시 선택된 위치를 기반으로 마커 추가
  }

  // 선택된 위치에 마커 추가
  void _setMarker() {
    setState(() {
      markers.add(Marker(
        markerId: UniqueKey().toString(),
        latLng: widget.usage.location,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상세 이용 지도'),
        backgroundColor: safeTgreen,
      ),
      body: KakaoMap(
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        markers: markers.toList(),  // 마커들을 지도에 추가
        center: widget.usage.location,  // 지도 중심 설정
      ),
    );
  }
}
