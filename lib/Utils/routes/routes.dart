import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen/Pages/HomePage/home_page.dart';
import 'package:flutter_onboarding_screen/Pages/SignUpPage/sign_up_page.dart';
import 'package:flutter_onboarding_screen/Utils/routes/route_names.dart';
import '../../Pages/LoginPage/login_page.dart';

class Routes {

  static Route<dynamic>  generateRoute(RouteSettings settings){

    switch(settings.name){
      // case RoutesName.splash:
      //   return MaterialPageRoute(builder: (BuildContext context) => const SplashView());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomePage());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginPage());
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (BuildContext context) => const SignUpPage());

      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}