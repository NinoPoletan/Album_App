import 'package:album_app/routes/camera_view.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'routes/collection_view.dart';
import 'routes/camera_view.dart';
import 'routes/profile_view.dart';
import 'routes/blank_view.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeView(),
      routes: {
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

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _bottomNavigationIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Foto Album'),
      ),
      body: const HomeView(),
      floatingActionButton: Visibility(
        visible: _bottomNavigationIndex == 0,
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: dodajFoto,
          backgroundColor: Colors.green,
          foregroundColor: Colors.amber.shade500,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            label: 'Collection',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _bottomNavigationIndex,
        selectedItemColor: Colors.amber.shade500,
        onTap: _onItemTapped,
        backgroundColor: Colors.green.shade400,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _bottomNavigationIndex = index;
    });
  }

  void dodajFoto() {
    print("dodajem fotografiju");
  }
}
