import 'package:flutter/material.dart';

class ButtonSignUpWithGoogle extends StatelessWidget {
  const ButtonSignUpWithGoogle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.0,
      child: ElevatedButton(
        onPressed: (){},
        child: Text(
          "Sign up with Google",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xffDE5246),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
      ),
    );
  }
}