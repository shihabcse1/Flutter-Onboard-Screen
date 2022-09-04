import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen/Pages/HomePage/home_page.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'components/button_sign_in.dart';
import 'components/button_sign_up.dart';
import 'components/button_sign_up_with_facebok.dart';
import 'components/button_sign_up_with_google.dart';
import 'package:http/http.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var _isVisible = false;
  final countryPickerLogin = const FlCountryCodePicker();
  CountryCode? countryCode;

  @override
  Widget build(BuildContext context) {
    //final deviceWeight = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return StreamBuilder(
      //stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }else if(snapshot.hasData){
          return HomePage();
        }else if(snapshot.hasError){
          return Center(child: Text("Something went wrong"),);
        }else {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Container( // <--- Change here
                  padding: EdgeInsets.only(left: 16.0),
                  // <-- play with the double number
                  child: Image.asset("images/logo.png", scale: 2,)
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ToggleSwitch(
                    minWidth: 70.0,
                    cornerRadius: 20.0,
                    activeBgColors: [[Color(0xffFFFFFF)], [Color(0xffFFFFFF)],],
                    activeFgColor: Color(0xffE0115F),
                    inactiveBgColor: Color(0xffF4ACC7),
                    inactiveFgColor: Color(0xffE0115F),
                    initialLabelIndex: 1,
                    totalSwitches: 2,
                    labels: ['English', 'বাংলা'],
                    radiusStyle: true,
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                ),
              ],
              backgroundColor: Color(0xffE0115F),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: LayoutBuilder(builder: (ctx, constraints) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: deviceHeight * 0.05,),
                            Text("Sign In",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: deviceHeight * 0.03,),
                            Container(
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: Color(0xffEFEFEF),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Center(
                                  child: TextField(
                                    controller: phoneNumberController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Container(
                                        padding: EdgeInsets.symmetric(vertical: 6),
                                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            GestureDetector(
                                              onTap: () async{
                                                final code = await countryPickerLogin.showPicker(context: context);
                                                setState(() {
                                                  countryCode = code;
                                                });
                                              },
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: countryCode != null ? countryCode!.flagImage : null,
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Icon(
                                                    Icons.arrow_drop_down,
                                                    size: 24,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                                    decoration: BoxDecoration(
                                                      //color: Colors.black,
                                                      borderRadius: BorderRadius.circular(5),
                                                    ),
                                                    child: Text(
                                                      countryCode?.dialCode ?? "+880",
                                                      style: TextStyle(color: Colors.black),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: deviceHeight * 0.02,),
                            Container(
                              width: double.infinity,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: Color(0xffEFEFEF),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Center(
                                  child: TextField(
                                    controller: passwordController,
                                    obscureText: _isVisible ? false : true,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isVisible = !_isVisible;
                                          });
                                        },
                                        icon: Icon(
                                          _isVisible ? Icons.visibility : Icons
                                              .visibility_off,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'Password',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: deviceHeight * 0.01,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text("Forgot Password?",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),

                                ),
                              ],
                            ),
                            SizedBox(height: deviceHeight * 0.02,),
                            //ButtonSignIn(),
                            ///TOD0: Need to change
                            Container(
                              width: double.infinity,
                              height: 48.0,
                              child: ElevatedButton(

                                onPressed: (){

                                  print(phoneNumberController.text.trim().toString());
                                  print(passwordController.text.trim().toString());

                                  login(phoneNumberController.text.trim().toString(), passwordController.text.trim().toString());
                                    if(countryCode != null) {
                                        //login(phoneNumberController.text.trim().toString(), passwordController.text.trim().toString());
                                    }
                                },
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xffE0115F),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: deviceHeight * 0.02,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "or",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: deviceHeight * 0.02,),
                            ButtonSignUp(),
                            SizedBox(height: deviceHeight * 0.02,),
                            ButtonSignUpWithGoogle(),
                            SizedBox(height: deviceHeight * 0.02,),
                            ButtonSignUpWithFacebook(),

                          ],
                        );
                      },),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }
    );
  }

  void login(String phoneNumberLogin, String passwordLogin) async{
    String extraZero = "0";
    phoneNumberLogin = extraZero + phoneNumberLogin;
    print(phoneNumberLogin);
    print(passwordLogin);
      try{
        Response response = await post(
          Uri.parse("http://touch.raisawebcloud.com/api/login"),
          body: {
            'mobile' : phoneNumberLogin,
            'password' : passwordLogin
          }
        );

        if(response.statusCode == 200){
          var data = jsonDecode(response.body.toString());
          print("Login Successful");
          print(data);
        }else{
          print("Failed");
        }

      }catch(e){
        print(e.toString());
      }
  }
}








