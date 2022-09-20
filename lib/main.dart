import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen/Pages/HomePage/home_page.dart';
import 'package:flutter_onboarding_screen/Pages/OnBoardingPage/OnBoarding.dart';
import 'package:flutter_onboarding_screen/Provider/provider.dart';
import 'package:flutter_onboarding_screen/ViewModel/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ViewModel/auth_view_model.dart';
// import 'package:get/get.dart';


Future main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //checkLogin();
  runApp(const MyApp());
}

// void checkLogin() async{
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   String? userName = sharedPreferences.getString("name");
//   int? userStatus = sharedPreferences.getInt("status");
//   if(userStatus != null){
//     Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(
//             builder: (BuildContext context) =>
//                 HomePage()),
//             (Route<dynamic> route) => false);
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const OnBoarding(),
      ),
    );
  }
}
