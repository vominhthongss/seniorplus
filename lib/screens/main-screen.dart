import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/screens/home-screen.dart';
import 'package:seniorplus/screens/notification-screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text('Search Screen'),
    NotificationScreen(),
    Text('User Screen'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IndexedStack(
          // dùng ngăn xếp lưu lại
          index: _selectedIndex,
          children: _widgetOptions,
        ),
      ),
      // body: Center(
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: ImageIcon(
                  AssetImage("assets/images/home.png"),
                ),
                label: 'Trang chủ',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: ImageIcon(
                  AssetImage("assets/images/healthy.png"),
                ),
                label: 'Sức khoẻ',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: ImageIcon(
                  AssetImage("assets/images/bell.png"),
                ),
                label: 'Thông báo',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: ImageIcon(
                  AssetImage("assets/images/user.png"),
                ),
                label: 'Người dùng',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: const Color(0xFF5fb36e),
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.white,
            showUnselectedLabels: true,
            unselectedFontSize: 12,
            selectedFontSize: 12,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
