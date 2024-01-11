import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ActorItem extends StatelessWidget {
  final String imageUrl;
  final String name, firstName;
  const ActorItem(
      {super.key,
      required this.imageUrl,
      required this.firstName,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(500),
            child: Image(
              image: NetworkImage(imageUrl),
              alignment: Alignment.center,
              fit: BoxFit.cover,
              height: 600,
              width: 300,
            ),
          ),
          Text(
            name,
            style: GoogleFonts.ptSansNarrow(fontSize: 50),
            textAlign: TextAlign.start,
          ),
          Text(
            firstName,
            style: GoogleFonts.ptSansNarrow(fontSize: 30, color: Colors.grey),
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }
}
