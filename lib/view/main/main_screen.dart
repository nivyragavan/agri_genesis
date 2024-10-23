import 'package:agri_genesis/view/main/tabs/account_screen.dart';
import 'package:agri_genesis/view/main/tabs/center_screen.dart';
import 'package:agri_genesis/view/main/tabs/farm_screen.dart';
import 'package:agri_genesis/view/main/tabs/forum_screen.dart';
import 'package:agri_genesis/view/main/tabs/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;

  final List<Widget> screens = <Widget>[
    const HomeScreen(),
    const CenterScreen(),
    const ForumScreen(),
    const FarmScreen(),
    const AccountScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex], // Display selected page
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        onTap: _onItemTapped,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/home.svg",color: _selectedIndex == 0 ? Colors.black : Colors.grey,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1 ? Image.asset("assets/icons/selectedMap.png") : Image.asset("assets/icons/map.png"),
            label: 'Near by Center',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2 ? Image.asset("assets/icons/selectedForum.png") : Image.asset("assets/icons/forum.png"),
            label: 'Forum',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3 ? Image.asset("assets/icons/selectedFarm.png") : Image.asset("assets/icons/farm.png"),
            label: 'My Farm',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 4 ? Image.asset("assets/icons/selectedAccount.png") : Image.asset("assets/icons/account.png"),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
