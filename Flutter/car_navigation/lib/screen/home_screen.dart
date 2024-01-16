import 'package:car_navigation/widget/car_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coches de Alta Gama', style: TextStyle(fontWeight: FontWeight.bold),),centerTitle: true,leading: const Icon(Icons.car_rental),),
      body: ListView(
        children: const [
          CarItem(name: 'Fiat Multipla',
           isAutomatic:false, sites: 5, price: 1200, 
           imageUrl: 'https://images.prismic.io/shacarlacca/OGJmZmFjZjAtZjM1Yi00OWVhLTkxODktMjU3NjZlYjExOWM3_cfa61243-09a1-4b87-a758-f245cee5951crulecf-450.png?auto=compress,format&rect=0,0,450,259&w=450&h=259'),
           CarItem(name: 'Tata nano',
           isAutomatic:true, sites: 4, price: 1600, 
           imageUrl: 'https://www.kumaranautomobiles.com/images/nano/abouts.png'),
           CarItem(name: 'Sebring-Vanguard Citicar',
           isAutomatic:false, sites: 3, price: 2400, 
           imageUrl: 'https://thechezcar.files.wordpress.com/2020/01/cropped-the-chez-citicar-icon-512.png?w=240')
        ],
      ),
    );
  }
}