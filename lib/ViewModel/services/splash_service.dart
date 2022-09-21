import 'package:flutter_onboarding_screen/Pages/LoginPage/login_page.dart';
import 'package:flutter_onboarding_screen/Pages/OnBoardingPage/OnBoarding.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/user_model.dart';
import '../../Pages/HomePage/home_page.dart';
import '../user_view_model.dart';
import 'package:flutter/material.dart';

class SplashServices {

  Future<UserModel> getUserDate() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context)async{

    getUserDate().then((value)async{
      print(value.token.toString());
      if(value.token.toString() == 'null' || value.token.toString() == ''){
        await Future.delayed(const Duration(seconds: 3));
        //Navigator.pushNamed(context, RoutesName.login);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OnBoarding(),
          ),
        );
      }else {
        await  Future.delayed(const Duration(seconds: 3));
        //Navigator.pushNamed(context, RoutesName.home);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HomePage(),
          ),
        );
      }

    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });
  }
}
