import 'package:flutter/material.dart';
import 'package:wallpaperapp/widgets/widget.dart';



class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: AppName(),
        elevation: 0.0,
      ),
      body: Container(child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xfff5f8fd),
              borderRadius: BorderRadius.circular(30)
            ),

            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(children: const <Widget>[
              Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "search wallpapers",
                  border: InputBorder.none
                ),
              ),
              ),
              Icon(Icons.search),
            ],),
          )
        ],),),
    );
  }
}