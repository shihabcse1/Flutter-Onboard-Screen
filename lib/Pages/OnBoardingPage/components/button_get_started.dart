import 'package:flutter/material.dart';
import '../../LoginPage/login_page.dart';
import '../content_model.dart';

class ButtonGetStarted extends StatelessWidget {
  const ButtonGetStarted({
    Key? key,
    required this.currentIndex,
    required PageController? controller,
  }) : _controller = controller, super(key: key);

  final int currentIndex;
  final PageController? _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: EdgeInsets.all(40.0),
      width: double.infinity,
      color: Colors.white,
      child: ElevatedButton(
        child: Text("Get Started"),
        onPressed: (){
          if(currentIndex == contents.length - 1){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => LoginPage(),
              ),
            );
          }
          _controller?.nextPage(
            duration: Duration(milliseconds: 100),
            curve: Curves.bounceIn,
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xffE0115F),
          textStyle: TextStyle(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}