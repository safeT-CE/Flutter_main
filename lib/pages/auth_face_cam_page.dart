import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:safet/main.dart'; 
import 'package:safet/models/user_info.dart';
import 'package:safet/pages/auth_done_page.dart';

class FaceCamPage extends StatefulWidget {
  final CameraDescription frontCamera;
  final File licenseImage;
  final UserInfo userInfo;

  FaceCamPage({
    required this.frontCamera,
    required this.userInfo,
    required this.licenseImage,
  });

  @override
  _FaceCamPageState createState() => _FaceCamPageState();
}

class _FaceCamPageState extends State<FaceCamPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.frontCamera,
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();
      final faceImage = File(image.path);
      await _uploadImages(faceImage);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AuthDonePage(userInfo: widget.userInfo),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> _uploadImages(File faceImage) async {
    // 이미지 업로드를 서버에 수행하거나 필요한 작업 수행
  }

  @override
  Widget build(BuildContext context) {
    print('FaceCamPage - UserInfo received: ${widget.userInfo.toString()}');

    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  '얼굴을 영역 안에 맞추고\n촬영해 주세요.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 30),
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 2),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 16,
            right: 16,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: safeTgreen,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: _takePicture,
              child: Text(
                '다음',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
