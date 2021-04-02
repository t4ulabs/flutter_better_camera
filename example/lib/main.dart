import 'dart:async';
import 'package:flutter_better_camera/camera.dart';
import 'package:flutter/material.dart';
import './camera_home.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  // Fetch the available cameras before initializing the app.
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
    
  } on CameraException catch (e) {
    //logError(e.code, e.description);
  }
  runApp(CameraApp());
}

class CameraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CameraHome(
        cameras: cameras,
      ),
    );
  }
}
