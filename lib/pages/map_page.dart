import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:safet/main.dart';

Set<Marker> markers = {}; // 마커 변수

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late KakaoMapController mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    // 초기화 시 현재 위치를 기반으로 마커 추가
    _getCurrentLocation();
  }

  // 현재 위치 가져오기
  void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      setState(() {
        markers.add(Marker(
          markerId: UniqueKey().toString(),
          latLng: LatLng(position.latitude, position.longitude),
        ));
      });

    } catch (e) {
      print("Error while fetching location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('지도'),
      ),
      body: KakaoMap(
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        markers: markers.toList(),
        center: markers.isEmpty ? LatLng(37.3608681, 126.9306506) : markers.first.latLng,
      ),
    );
  }
}