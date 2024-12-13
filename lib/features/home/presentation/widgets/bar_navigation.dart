import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t3/core/utils/assets.dart';

class BarNavigation extends StatefulWidget {
  const BarNavigation({super.key});

  @override
  State<BarNavigation> createState() =>
      _BarNavigationState();
}

class _BarNavigationState extends State<BarNavigation> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey[600],
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconsAssets.airplane,
            color: _currentIndex == 0 ? Colors.blue : Colors.grey[600],
          ),
          label: 'Авиабилеты',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconsAssets.hotels,
            color: _currentIndex == 1 ? Colors.blue : Colors.grey[600],
          ),
          label: 'Отели',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconsAssets.location,
            color: _currentIndex == 2 ? Colors.blue : Colors.grey[600],
          ),
          label: 'Короче',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconsAssets.notification,
            color: _currentIndex == 3 ? Colors.blue : Colors.grey[600],
          ),
          label: 'Подписки',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconsAssets.profil,
            color: _currentIndex == 4 ? Colors.blue : Colors.grey[600],
          ),
          label: 'Профиль',
        ),
      ],
    );
  }
}