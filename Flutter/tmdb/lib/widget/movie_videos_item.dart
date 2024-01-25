import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/screen/video_screen.dart';

class MovieVideosItem extends StatelessWidget {
  const MovieVideosItem({super.key, required this.videoKey});
  final String videoKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => TrailerScreen(
                      id: videoKey,
                    )));
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          width: 200,
          height: 400,
          color: Colors.black,
          child: Image(
            image: NetworkImage(
                'https://img.youtube.com/vi/$videoKey/maxresdefault.jpg'),
            width: 200,
            height: 400,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
