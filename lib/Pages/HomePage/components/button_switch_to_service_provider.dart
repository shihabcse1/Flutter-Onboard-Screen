import 'package:flutter/material.dart';

class ButtonSwitchToServiceProvider extends StatelessWidget {
  const ButtonSwitchToServiceProvider({
    Key? key,
    required this.deviceHeight,
  }) : super(key: key);

  final double deviceHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight * 0.06,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ElevatedButton(
          onPressed: () {

          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //mainAxisSize: MainAxisSize.min,
            children: [
              Text('Switch to service provider'), // <-- Text
              SizedBox(
                width: 5,
              ),
              Icon( // <-- Icon
                Icons.arrow_right_alt,
                size: 24.0,
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            primary: Color(0xffE0115F),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
      ),

    );
  }
}