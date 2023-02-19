
import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../home/home.dart';
import '../record/record.dart';
import '../saved/saved.dart';
import '../search/search.dart';
import '../settings/settings.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {

  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Search(),
    const Record(),
    const Saved(),
    const Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:  const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(Images.homeIcon),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(Images.searchIcon),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(Images.videoIcon),
            ),
            label: 'Record',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(Images.saveIcon),
            ),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(Images.settingIcon),
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorResources.colorPrimary,
        onTap: _onItemTapped,
      ),

    );
  }
}
