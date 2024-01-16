import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.name, required this.imageUrl});
  final String name, imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold),),
        leading: CupertinoButton(
          onPressed: (){Navigator.pop(context);},
          child: const Icon(Icons.arrow_back, ),
        ),
      ),
      body: ListView(
        
        children: [
          Container(
            height: 900,
            color: Colors.black,
            child: Column(
              children: [
                Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,letterSpacing: 2,fontSize: 50),textAlign: TextAlign.center, ),
                Hero(tag: imageUrl,child: Image(image: NetworkImage(imageUrl), fit: BoxFit.contain, width: 600, height: 500,alignment: Alignment.centerRight, ),),
                const Text('The Best Car For You', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,letterSpacing: 2,fontSize: 40, decoration: TextDecoration.underline), )
              ],
            )
          ),
          const Text('SPECIFICATIONS', textAlign: TextAlign.center,style: TextStyle( fontWeight: FontWeight.bold,letterSpacing: 2,fontSize: 35, decoration: TextDecoration.underline))
          ,
          Container(
            padding: const EdgeInsets.all(10),
            child:const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: Card(
                    child: Column(
                      children: [
                        Text('130cv'),
                        Text('')
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Card(
                    child:Column(
                      children: [
                        Text('130cv'),
                        Text('')
                  
                      ],
                    ) ,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}