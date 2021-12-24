import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => FrontPage();
}

class FrontPage extends State<HomePage> {
  late PageController pageController;

  var heroes = ["Thor", "Hulk", "Iron Man", "Black Widow", "Captain"];

  var images = [
    'images/thor.jpg',
    'images/hulk.jpg',
    'images/ironman.jpg',
    'images/widow.jpg',
    'images/capitan.jpg'
  ];

  buildSlider(int index) {
    return Container(
        child: Center(
            child: Text(heroes[index],
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    height: 11,
                    shadows: [
                      Shadow(
                          // bottomLeft
                          offset: Offset(-1.5, -1.5),
                          color: Colors.black),
                      Shadow(
                          // bottomRight
                          offset: Offset(1.5, -1.5),
                          color: Colors.black),
                      Shadow(
                          // topRight
                          offset: Offset(1.5, 1.5),
                          color: Colors.black),
                      Shadow(
                          // topLeft
                          offset: Offset(-1.5, 1.5),
                          color: Colors.black),
                    ]))),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(images[index]), fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.all(20));
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Column(children: [
            Image.asset('images/log.png'),
            const Text("Choose hero!",
                style: TextStyle(color: Colors.white, fontSize: 30))
          ]),
          Expanded(
              child: PageView.builder(
                  controller: pageController,
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int position) {
                    return buildSlider(position);
                  }))
        ])));
  }
}
