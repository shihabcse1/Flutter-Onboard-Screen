import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen/Pages/HomePage/home_icon_model.dart';
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
            Column(

              children: [
                SizedBox(height: 20,),
                Container(
                  height: 48,
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
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //SizedBox(width: 5,),
                    GestureDetector(
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
                              contentsHomepage[0].image!,
                              //height: 300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(contentsHomepage[0].title!, style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(width: 5,),
                    GestureDetector(
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
                    ),
                    GestureDetector(
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
                              contentsHomepage[2].image!,
                              //height: 300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(contentsHomepage[2].title!, style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
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
                              contentsHomepage[3].image!,
                              //height: 300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(contentsHomepage[3].title!, style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //SizedBox(width: 5,),
                    GestureDetector(
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
                              contentsHomepage[4].image!,
                              //height: 300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(contentsHomepage[4].title!, style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(width: 5,),
                    GestureDetector(
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
                                  offset: Offset(2.0, 2.0),
                                  //shadow direction: bottom right
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(
                              contentsHomepage[5].image!,
                              //height: 300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(contentsHomepage[5].title!, style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
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
                              contentsHomepage[6].image!,
                              //height: 300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(contentsHomepage[6].title!, style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
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
                              contentsHomepage[7].image!,
                              //height: 300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(contentsHomepage[7].title!, style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Best Tourist Place",
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                    ),
                    ),
                    Text(
                        "See all",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),

                Container(
                  width: 300,
                  height: 285,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(image: AssetImage("images/tourest_place_one.png")),
                  ),

                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
