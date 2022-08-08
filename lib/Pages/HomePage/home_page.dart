import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 16.0, bottom: 10.0),
          child: CircleAvatar(
            radius: 16.0,
            child: ClipRRect(
              child: Image.asset('images/dummy_profile_pic.png'),
              borderRadius: BorderRadius.circular(50.0),
            ),
            backgroundColor: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        title: Container(   // <--- Change here
            child: Text("Shafqat Ahmed"),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Image.asset("images/logo_only.png",),
          ),
        ],
        backgroundColor: Color(0xffE0115F),
      ),

    );
  }
}
