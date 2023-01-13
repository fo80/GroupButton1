import 'package:flutter/material.dart';

import 'ColorPicker.dart';

class Stack_indexedstack extends StatefulWidget {
  const Stack_indexedstack({Key? key}) : super(key: key);

  @override
  State<Stack_indexedstack> createState() => _Stack_indexedstackState();
}

class _Stack_indexedstackState extends State<Stack_indexedstack> {
  int _currentindex = 0;
  int _currentcoloe = 0;

  final List<Color> colors = [
    Color(0xFF7B1FA2),
    Color(0xFF76FF03),
    Color(0xFFD32F2F),
    Color(0xFF848484),
    Color(0xFF1976D2),
    Color(0xFFFDD500),
    Color(0xFF0D47A0),
    Color(0xFFFFFFFF),
    Color(0xFFFD9D40),
    Color(0xFF02D70A),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Stack(
      children: [
        Container(
            width: double.infinity,
            child: Image.asset(
              "images/images1/12.jpg",
              fit: BoxFit.cover,
            )),
        IndexedStack(
          index: _currentindex,
          children: [
            page1(imagepath: "images/images1/1.png"),
            page1(imagepath: "images/images1/2.png"),
            page1(imagepath: "images/images1/3.png"),
            page1(imagepath: "images/images1/4.png"),
            page1(imagepath: "images/images1/5.png"),
            page1(imagepath: "images/images1/6.png"),
            page1(imagepath: "images/images1/7.png"),
            page1(imagepath: "images/images1/8.png"),
            page1(imagepath: "images/images1/9.png"),
            page1(imagepath: "images/images1/10.png"),
          ],
        ),
        Positioned(
          top: 90,
          right: 5,
          bottom: 150,
          child: Container(
            height: 320,
            width: 50,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(30)),
            child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        _currentindex = index;
                        _currentcoloe = index;
                      });
                    },
                    child: ColorPicker(colors[index], _currentcoloe == index)),
                separatorBuilder: (context, i) => SizedBox(
                      height: 3,
                    ),
                itemCount: colors.length),
          ),
        )
      ],
    )));
  }
}

class favorit extends StatefulWidget {
  const favorit({Key? key}) : super(key: key);

  @override
  State<favorit> createState() => _favoritState();
}

class _favoritState extends State<favorit> {
  bool click = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 300, top: 75),
      child: Column(
        children: [
          Container(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.only(right: 10, bottom: 5),
                    minimumSize: Size.square(60),
                    backgroundColor: Colors.white12),
                onPressed: () {
                  setState(() {
                    click = !click;
                  });
                },
                child: IconButton(
                  icon: Icon(
                    click ? Icons.favorite_border : Icons.favorite,
                    size: 45,
                  ),
                  color: click ? Colors.red : Colors.red,
                  onPressed: () {
                    setState(() {
                      click = !click;
                    });
                  },
                )),
          ),
        ],
      ),
    );
  }
}

class page1 extends StatelessWidget {
  const page1({
    Key? key,
    required this.imagepath,
  }) : super(key: key);
  final String imagepath;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Container(
          margin: EdgeInsets.only(top: 5),
          child: favorit(),
        ),
        height: 750,
        width: double.infinity,
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage(imagepath))),
      ),
    );
  }
}
