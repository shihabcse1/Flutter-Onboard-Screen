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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //SizedBox(width: 5,),
                GestureDetector(
                  onTap: () {
                    print('onTap');
                  },
                  child: Container(
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
                      "images/flight_icon.svg",
                      //height: 300,
                    ),
                    //Image.asset("images/flight_icon.png",),
                  ),
                ),

                //SizedBox(width: 5,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}