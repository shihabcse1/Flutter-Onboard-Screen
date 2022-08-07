import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextComponent extends StatelessWidget {
  const RichTextComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
      text: 'Didn\'t receive the code. ',
      style: TextStyle(
        color: Colors.black,
      ),
      children: [
        TextSpan(
            text: " Resend SMS",
            style: TextStyle(
              color: Color(0xffE0115F),
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()..onTap = (){

            }
        ),
      ],
    ));
  }
}