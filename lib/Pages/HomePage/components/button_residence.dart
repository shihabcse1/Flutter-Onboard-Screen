import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../home_icon_model.dart';

class ButtonResidence extends StatelessWidget {
  const ButtonResidence({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('onTap');
      },
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 64.0,
            width: 64.0,
            decoration: BoxDecoration(
              color: Color(0xffFADBE7),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.white30,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                ),
              ],
            ),
            child: SvgPicture.asset(
              contentsHomepage[1].image!,
              //height: 300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(contentsHomepage[1].title!, style: TextStyle(fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}