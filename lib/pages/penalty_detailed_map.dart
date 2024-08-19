import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

import 'violation_data.dart'; // ViolationItem 클래스 import

class PenaltyDetailedMapPage extends StatefulWidget {
  final ViolationItem violation;

  PenaltyDetailedMapPage({required this.violation});

  @override
  _PenaltyDetailedMapPageState createState() => _PenaltyDetailedMapPageState();
}

class _PenaltyDetailedMapPageState extends State<PenaltyDetailedMapPage> {
  late KakaoMapController mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _setMarker();
  }

  void _setMarker() {
    setState(() {
      markers.add(Marker(
        markerId: UniqueKey().toString(),
        latLng: LatLng(widget.violation.latitude, widget.violation.longitude),  // 위반 위치를 기반으로 LatLng 설정 (여기서 샘플로 서울 시청 위치 사용)
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.violation.title} 위치'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: KakaoMap(
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        markers: markers.toList(),
        center: LatLng(widget.violation.latitude, widget.violation.longitude), // 지도 중심 위치 (여기서 샘플로 서울 시청 위치 사용)
      ),
    );
  }
}
