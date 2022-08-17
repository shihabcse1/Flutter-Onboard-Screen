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
    final String image;
    final Function press;

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
        backgroundColor: Color(0xffE0115F),
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
                child: Text("Flight"),
            ),
            Card(
              child: ListTile(
                leading: ImageIcon(
                  AssetImage("images/flight_sidebar.png"),
                  color: Colors.black,
                ),
                title: Text('Flight'),
              ),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
            Card(
              child: ListTile(
                leading: ImageIcon(
                  AssetImage("images/stay_place_sidebar_icon.png"),
                  color: Colors.black,
                ),
                title: Text('Stay Place'),
              ),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
            Card(
              child: ListTile(
                leading: ImageIcon(
                  AssetImage("images/bus_sidebar_icon.png"),
                  color: Colors.black,
                ),
                title: Text('Bus'),
              ),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
            Card(
              child: ListTile(
                leading: ImageIcon(
                  AssetImage("images/rental_sidebar_icon.png"),
                  color: Colors.black,
                ),
                title: Text('Rental'),
              ),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
            Card(
              child: ListTile(
                leading: ImageIcon(
                  AssetImage("images/launch_sidebar_icon.png"),
                  color: Colors.black,
                ),
                title: Text('Launch'),
              ),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
            Card(
              child: ListTile(
                leading: ImageIcon(
                  AssetImage("images/tourist_package_sidebar_icon.png"),
                  color: Colors.black,
                ),
                title: Text('Tourist Package'),
              ),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
            Card(
              child: ListTile(
                leading: ImageIcon(
                  AssetImage("images/food_delivery_icon.png"),
                  color: Colors.black,
                ),
                title: Text('Food Delivery'),
              ),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),

          ],
        )
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

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 10,
                              top: 10,
                            bottom: 10,
                          ),
                          width: 270,
                          height: 293,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                                image: AssetImage("images/tourest_place_one.png")
                            ),
                          ),

                        ),
                      ),
                      GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            top: 10,
                            bottom: 10,
                          ),
                          width: 270,
                          height: 293,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("images/tourest_place_one.png")
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 30.0,
          right: 30.0,
        ),
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -10),
              blurRadius: 35,
              color: Colors.white.withOpacity(0.38),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: (){

                },
                icon: SvgPicture.asset("images/home_icon.svg")
            ),
            IconButton(
                onPressed: (){

                },
                icon: SvgPicture.asset("images/history_icon.svg")
            ),
            IconButton(
                onPressed: (){

                },
                icon: SvgPicture.asset("images/inbox_icon.svg")
            ),
            IconButton(
                onPressed: (){

                },
                icon: SvgPicture.asset("images/account_icon.svg")
            ),
          ],
        ),
      ),
    );
  }
}
