import 'package:flutter/material.dart';

class ButtonVerify extends StatelessWidget {
  const ButtonVerify({
    Key? key,
    required this.deviceHeight,
    required this.deviceWeight,
  }) : super(key: key);

  final double deviceHeight;
  final double deviceWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.0,
      margin: EdgeInsets.only(
        top: deviceHeight * 0.02,
        left: deviceWeight * 0.03,
        right: deviceWeight * 0.03,
      ),
      child: ElevatedButton(
        onPressed: (){},
        child: Text(
          "Verify",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xffE0115F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
      ),
    );
  }
}