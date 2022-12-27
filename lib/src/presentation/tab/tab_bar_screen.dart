import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/presentation/auth/sign_up_screen.dart';
import 'package:ask_watson_app/src/presentation/main/main_screen.dart';
import 'package:ask_watson_app/src/presentation/mypage/mypage_screen.dart';
import 'package:flutter/material.dart';

//TODO : view model 수정
//TODO : router 적용
class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    MainScreen(),
    MainScreen(),
    MainScreen(),
    SignUpScreen(),
    MypageScreen()
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
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_cafe),
            label: 'Cafe',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Theme',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Mypage',
          ),
        ],
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        unselectedItemColor: MyColor.grey,
        selectedItemColor: MyColor.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
