import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final String? imgUrl;
  ImageView({@required this.imgUrl});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
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
              child: Image.network(widget.imgUrl!, fit: BoxFit.cover,)),
          ),

            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width/2,
                      decoration: BoxDecoration(
                        color: const Color(0xff1C1B1B).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width/2,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white54, width: 1),
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)],
                        )
                      ),
                      child: Column(children: const <Widget>[
                        Text("Apply Wallpaper", style: TextStyle(fontSize: 16, color: Colors.white70),),
                        Text("Image will be saved in Gallery", style: TextStyle(fontSize: 11, color: Colors.white70),),
                      ],),
                    ),
                ],
                ),
                const SizedBox(height: 15,),
                const Text("Cancel", style: TextStyle(color: Colors.white),),
                const SizedBox(height: 50,)
              ],)
            ),
        ],
      ),
    );
  }
}
