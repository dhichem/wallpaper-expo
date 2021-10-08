import 'package:flutter/material.dart';
import 'package:wallpaperapp/model/wallpaper_model.dart';

// ignore: non_constant_identifier_names
Widget AppName() {
  return RichText(
    text: const TextSpan(
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      children: <TextSpan>[
        TextSpan(text: 'Wallpaper', style: TextStyle(color: Colors.black87)),
        TextSpan(text: 'Expo', style: TextStyle(color: Colors.red)),
      ],
    ),
  );
}

Widget WallpapersList({required List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallp) {
        return GridTile(
          child: Container(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(wallp.src!.portrait!, fit: BoxFit.cover)),
          ),
        );
      }).toList(),
    ),
  );
}
