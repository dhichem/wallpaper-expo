import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageView extends StatefulWidget {
  final String? imgUrl;
  ImageView({@required this.imgUrl});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  var filePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imgUrl!,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.imgUrl!,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      saveWallpaper();
                    },
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            color: const Color(0xff1C1B1B).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white54, width: 1),
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)],
                              )),
                          child: Column(
                            children: const <Widget>[
                              Text(
                                "Apply Wallpaper",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white70),
                              ),
                              Text(
                                "Image will be saved in Gallery",
                                style: TextStyle(
                                    fontSize: 11, color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              )),
        ],
      ),
    );
  }

  // function for asking the user to use the Gallery
  _getPermission() async {
    if (Platform.isIOS) {
      Map<PermissionGroup, PermissionStatus> permission =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.photos]);
    } else {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
    }
  }

  // function that saves the wallpaper in Gallery
  saveWallpaper() async {
    if (Platform.isAndroid) {
      await _getPermission();
    }

    var response = await Dio().get(widget.imgUrl!,
        options: Options(responseType: ResponseType.bytes));

    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));

    print(result);
    Navigator.pop(context);
  }
}
