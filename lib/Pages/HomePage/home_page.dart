import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen/Pages/HomePage/home_icon_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/button_bus.dart';
import 'components/button_flight.dart';
import 'components/button_food.dart';
import 'components/button_launch.dart';
import 'components/button_rental.dart';
import 'components/button_residence.dart';
import 'components/button_switch_to_service_provider.dart';
import 'components/button_tour_package.dart';
import 'components/button_tour_spot.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final user = FirebaseAuth.instance.currentUser;

  List<bool> isItemSelected = [
    true,
    false,
    false,
    false,
  ];

  void isSelected(int value){
    setState(() {
      for (int i = 0 ; i < isItemSelected.length; i++){
        if(i == value){
          isItemSelected[i] = true;
        }else{
          isItemSelected[i] = false;
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final String image;
    final Function press;
    final deviceHeight = MediaQuery.of(context).size.height;
    //final deviceWeight = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: buildAppBarHomePage(),
      endDrawer: buildDrawerHomePage(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(

              children: [
                SizedBox(height: deviceHeight * 0.02,),
                ButtonSwitchToServiceProvider(deviceHeight: deviceHeight),
                SizedBox(height: deviceHeight * 0.02,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonFlight(),
                      ButtonResidence(),
                      ButtonBus(),
                      ButtonRental(),
                    ],
                  ),
                ),
                SizedBox(height: deviceHeight * 0.01,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonLaunch(),
                      ButtonTourPackage(),
                      ButtonTourSpot(),
                      ButtonFood(),
                    ],
                  ),
                ),
                SizedBox(height: deviceHeight * 0.02,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
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
                ),
                SizedBox(height: deviceHeight * 0.01,),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
        height: deviceHeight * 0.1,
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
                  isSelected(0);
                },
                icon: SvgPicture.asset(
                  "images/home_icon.svg",
                  color : isItemSelected[0] == true ? Color(0xffE0115F) : Color(0xff000000),
                )
            ),
            IconButton(
                onPressed: (){
                  isSelected(1);
                },
                icon: SvgPicture.asset(
                    "images/history_icon.svg",
                  color : isItemSelected[1] == true ? Color(0xffE0115F) : Color(0xff000000),
                ),
            ),
            IconButton(
                onPressed: (){
                  isSelected(2);
                },
                icon: SvgPicture.asset(
                    "images/inbox_icon.svg",
                  color : isItemSelected[2] == true ? Color(0xffE0115F) : Color(0xff000000),
                ),
            ),
            IconButton(
                onPressed: (){
                  isSelected(3);
                },
                icon: SvgPicture.asset(
                    "images/account_icon.svg",
                  color : isItemSelected[3] == true ? Color(0xffE0115F) : Color(0xff000000),
                ),
            ),
          ],
        ),
      ),
    );
  }

  Drawer buildDrawerHomePage() {
    return Drawer(
      backgroundColor: Colors.white,
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(

            decoration: BoxDecoration(
              //color: Colors.white60,
              image: DecorationImage(
                  image: AssetImage("images/logo_red.png",)
              ),
            ),
              child: Text(""),

          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
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
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
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
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
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
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
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
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
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
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
              child: ListTile(
                leading: ImageIcon(
                  AssetImage("images/tourist_package_sidebar_icon.png"),
                  color: Colors.black,
                ),
                title: Text('Tourist Package'),
              ),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
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
          ),

        ],
      )
    );
  }

  AppBar buildAppBarHomePage() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 16.0, bottom: 10.0),
        child: CircleAvatar(
          radius: 16.0,
          child: ClipRRect(
            //child: Image.asset('images/dummy_profile_pic.png'),
            //child: user.photoURL == null ? Image.asset('images/dummy_profile_pic.png') : Image.network(user.photoURL!),
            borderRadius: BorderRadius.circular(50.0),
          ),
          backgroundColor: Colors.white,
        ),
      ),
      automaticallyImplyLeading: false,
      title: Container(   // <--- Change here
          child: user?.displayName == null ? Text("Dummy") : Text("TESt"),
      ),
      backgroundColor: Color(0xffE0115F),
    );
  }
}


















