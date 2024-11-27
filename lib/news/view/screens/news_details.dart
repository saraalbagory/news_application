import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  // ArticalModel
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            //designSize:DecorationImage(image: image)
            image:
                DecorationImage(image: AssetImage("assets/images/pattern.png")),
            color: Colors.white),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(),
          ),
        ));
  }
}
