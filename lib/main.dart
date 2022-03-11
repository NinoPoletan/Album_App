import 'package:album_app/routes/camera_view.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'routes/collection_view.dart';
import 'routes/camera_view.dart';
import 'routes/profile_view.dart';
import 'routes/blank_view.dart';
import 'routes/home_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final camera;
  const MyApp({Key? key, required this.camera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foto Album',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeView(),
      routes: {
        '/': (context) => const BlankView(),
        '/login/': (context) => const BlankView(),
        '/register/': (context) => const BlankView(),
        '/profile/': (context) => ProfileView(),
        '/edit_profile/': (context) => const BlankView(),
        '/colection/': (context) => const CollectionView(),
        '/home/': (context) => const HomeView(),
        '/camera/': (context) => CameraView(camera: camera),
      },
    );
  }
}
