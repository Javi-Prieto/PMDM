import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActorItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  const ActorItem({super.key, required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          
           
          child: Image(image: NetworkImage(imageUrl), alignment: Alignment.center,),
        ),
        Text(name)
      ],
    );
  }
}