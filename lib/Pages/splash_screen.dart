import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen/ViewModel/services/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    // print("Splash");

    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Text('Splash screen', style: Theme.of(context).textTheme.headline4,),
      ),
    );
  }
}
