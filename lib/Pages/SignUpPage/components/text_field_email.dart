import 'package:flutter/material.dart';

class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      decoration: BoxDecoration(
        color: Color(0xffEFEFEF),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Center(
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            maxLines: 1,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'mdhasansridoy@gmail.com',
            ),
          ),
        ),
      ),
    );
  }
}