import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'content_model.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: contents.length,
          itemBuilder: (_ , i){
            return Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  SvgPicture.asset(
                    contents[i].image!,
                    height: 300,
                  ),
                  Text(
                    contents[i].title!,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
