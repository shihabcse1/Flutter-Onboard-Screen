import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        itemCount: 3,
          itemBuilder: (_ , i){
            return Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  SvgPicture.asset(
                    "images/air_ticket.svg",
                    height: 300,
                  ),
                  Text(
                    "Quality food",
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
