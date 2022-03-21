
import 'package:flutter/material.dart';
import '../../Widgets/gradient_bar.dart';
import '../../Widgets/category_selector.dart';
import '../../Models/message_model.dart';
import '../../Widgets/recent_chats.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Message> chats = Message.chats;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //TopBar
        GradientTop(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Center(
                child: Text(
                  'UrbanChat',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              elevation: 0.0,
              leading: IconButton(
                color: Colors.black,
                onPressed: () {
                  //TODO implement menu
                },
                icon: Icon(Icons.menu),
              ),
              actions: [
                IconButton(
                  color: Colors.black,
                  onPressed: () {
                    //TODO implement search
                  },
                  icon: Icon(Icons.search),
                ),
              ],
            ),
            body: Column(
              children: [
                const CategorySelector(),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: const Center(
                    child: Text(
                        'Recent Chats',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                RecentChats(chats: chats),
              ],
            ),
            // bottomNavigationBar: null,
          ),
        ),
      ],
    );
  }
}
