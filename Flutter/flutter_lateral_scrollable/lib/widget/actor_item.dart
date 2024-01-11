import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActorItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  const ActorItem({super.key, required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(500),
            child: Image(
              image: NetworkImage(imageUrl),
              alignment: Alignment.center,
              fit: BoxFit.cover,
              height: 600,
            ),
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
