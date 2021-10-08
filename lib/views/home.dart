import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaperapp/api_key.dart';
import 'package:wallpaperapp/data/data.dart';
import 'package:wallpaperapp/model/categories_model.dart';
import 'package:wallpaperapp/model/wallpaper_model.dart';
import 'package:wallpaperapp/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CatgeoriesModel> categories =
      List<CatgeoriesModel>.empty(growable: true);

  List<WallpaperModel> wallpapers = List<WallpaperModel>.empty(growable: true);

  getTrendingPhotos() async {
    var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?page=1&per_page=15"),
        headers: {
          "Authorization":
              "563492ad6f91700001000001cf8c7ac1a0e740fdbf34eb945fff7469"
        });

    print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = WallpaperModel();

      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
  }

  @override
  void initState() {
    getTrendingPhotos();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: AppName(),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "search wallpapers",
                          border: InputBorder.none),
                    ),
                  ),
                  Icon(Icons.search),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 80,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoriesTile(
                      imageURL: categories[index].imageURL,
                      title: categories[index].categorieName,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String? imageURL, title;

  CategoriesTile({@required this.imageURL, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Image.network(
              imageURL!,
              height: 65,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 65,
            width: 110,
            color: Colors.black38,
            alignment: Alignment.center,
            child: Text(
              title!,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
