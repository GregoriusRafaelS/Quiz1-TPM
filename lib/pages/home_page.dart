import 'package:flutter/material.dart';
import 'package:quiz_tpm/pages/bangun_ruang_page.dart';
import 'package:quiz_tpm/pages/beranda_page.dart';
import 'package:quiz_tpm/pages/profile_page.dart';


class HomePage extends StatefulWidget {
  final String user, pass;
  HomePage({Key? key, required this.user, required this.pass})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      BerandaPage(),
      BangunRuangPage(),
      ProfilePage(),
    ];
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_center),
            label: 'Bangun Ruang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Bantuan',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
