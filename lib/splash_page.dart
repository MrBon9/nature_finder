import 'package:flutter/material.dart';
import 'package:nature_finder/ui/import_image_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/splash_screen.png'),
                  fit: BoxFit.cover),
            ),
          ),
          // Positioned(
          //     bottom: 16.0,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Material(
          //           color: Colors.white,
          //           child: MaterialButton(onPressed: () {}),
          //         ),
          //       ],
          //     ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ImportImagePage()));
          },
          backgroundColor: Colors.white,
          child: Icon(Icons.arrow_right_alt, color: Colors.green)),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
