import 'package:flutter/material.dart';
import 'package:wallpaperapp/model/wallpaper_model.dart';

// ignore: non_constant_identifier_names
Widget AppName() {
  return Row(
    children: const <Widget>[
      Text(
        "Wallpaper",
        style: TextStyle(color: Colors.black87),
      ),
      Text(
        "  App",
        style: TextStyle(color: Colors.red),
      )
    ],
  );
}

Widget WallpapersList({required List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallp) {
        return GridTile(
          child: Container(
            child: Image.network(wallp.src!.portrait!),
          ),
        );
      }).toList(),
    ),
  );
}
