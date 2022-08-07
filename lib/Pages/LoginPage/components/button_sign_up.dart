import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen/Pages/SignUpPage/sign_up_page.dart';

class ButtonSignUp extends StatelessWidget {
  const ButtonSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.0,
      child: ElevatedButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SignUpPage(),
            ),
          );
        },
        child: Text(
          "Sign Up",
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