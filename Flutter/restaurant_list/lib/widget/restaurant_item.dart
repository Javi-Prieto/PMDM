import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ResturantItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int  avgPrice;
  final double avgRating;
  final String address;
  const ResturantItem({super.key, required this.name, required this.imageUrl, required this.address, required this.avgPrice, required this.avgRating});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: Colors.white70,
      shadowColor: Colors.black,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: const EdgeInsets.all(10),
      child:  Column(
                children: [
                  Image(image:  NetworkImage(imageUrl), fit: BoxFit.fill, ),
                   Text(name, style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.location_city),
                      Text(address)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.money),
                      RichText(text: TextSpan(
                        text: '$avgPrice€'
                      ))
                    ],
                  ),
                  const Divider(),
                  RatingBar.builder(itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.red,
                  ), onRatingUpdate: (rating){print(rating);},
                  initialRating: avgRating,)

                ],
              ),
      );
  }
}