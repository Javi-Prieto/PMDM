import 'package:flutter/material.dart';
import 'package:google_maps_fuente_valencia/screen/home_screen.dart';
import 'package:google_maps_fuente_valencia/service/font_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Provider<FontService>(
        create: (BuildContext context) => FontService.create(),
        dispose: (_, FontService service) => service.client.dispose(),
        child: const HomeScreen(),
        ),
    );
  }
}
