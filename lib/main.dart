import 'package:flutter/material.dart';
import './stream_photos.dart';
import 'dart:async';
import 'package:camera/camera.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foto Album',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Foto Album'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _bottomNavigationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const StreamPhotos(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: dodajFoto,
        backgroundColor: Colors.green,
        foregroundColor: Colors.amber.shade500,
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
