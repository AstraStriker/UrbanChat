//Packages
import 'package:chat_app/Widgets/gradient_bg.dart';
import 'package:flutter/material.dart';

//Pages
import '../UsersPage/users_page.dart';
import 'chats_page.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final List<Widget> _pages = [
    ChatsPage(),
    UsersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  Widget _buildUI() {
    return GradientBg(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _pages[_currentPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          onTap: (_index) {
            setState(() {
              _currentPage = _index;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: "Chats",
              icon: Icon(
                Icons.chat_bubble_sharp,
              ),
            ),
            BottomNavigationBarItem(
              label: "Users",
              icon: Icon(
                Icons.supervised_user_circle_sharp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
