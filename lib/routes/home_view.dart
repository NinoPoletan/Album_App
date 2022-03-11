import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

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
