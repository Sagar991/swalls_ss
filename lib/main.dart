import 'package:flutter/material.dart';
import 'package:swalls/fav.dart';
import 'package:swalls/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SWalls',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'SWalls'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pages = [all_images(), Home(), Favorite()];
  final pageController = PageController(initialPage: 1);
  int currentSelected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ), // AppBar
      body: PageView.builder(
        controller: pageController,
        itemCount: pages.length,
        itemBuilder: (BuildContext context, int index) {
          return pages[index];
        },
        onPageChanged: (int index) {
          setState(() {
            currentSelected = index;
          });
        },
      ), // PageView.builder
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentSelected,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important_sharp),
            title: Text('All Images'),
          ), // BottomNavigationBarItem
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ), //BottomNavigationBarItem
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorite'),
          ), // BottomNavigationBarItem
        ],
        onTap: (int index) {
          setState(() {
            currentSelected = index;
            pageController.animateToPage(
              currentSelected,
              curve: Curves.elasticOut,
              duration: Duration(milliseconds: 400),
            );
          });
        },
      ), // BottomNavigationBar
    ); // Scaffold
  }

  // ignore: non_constant_identifier_names
  static all_images() {}
}
