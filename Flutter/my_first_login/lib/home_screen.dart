import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.red,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: NetworkImage('https://miravosblog.files.wordpress.com/2014/10/path-logo.jpg')),
                Text('Beautiful, Private & Sharing')
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Sign Up'),
                Text('Already have a Path account?'),
                Text('Log In'),
                Text('By using Path, you agree to Paths Terms of Use and Privacy Policy'),
              ],
            )
          ],
        ),
      ),
    );
  }
}