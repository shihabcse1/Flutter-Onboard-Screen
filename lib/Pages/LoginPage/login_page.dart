import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen/Pages/HomePage/home_page.dart';
import 'package:flutter_onboarding_screen/Utils/routes/route_names.dart';
import 'package:flutter_onboarding_screen/Utils/utils.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../Resources/color.dart';
import '../../Resources/components/round_button.dart';
import '../../ViewModel/auth_view_model.dart';
import '../SignUpPage/sign_up_page.dart';
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

  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // FocusNode phoneNumberFocusNode = FocusNode();
  // FocusNode passwordFocusNode = FocusNode();


  var _isVisible = false;
  final countryPickerLogin = const FlCountryCodePicker();
  CountryCode? countryCode;


  @override
  void dispose() {

    _phoneNumberController.dispose();
    _passwordController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final authViewModelProvider = Provider.of<AuthViewModel>(context);
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
          return const Center(child: Text("Something went wrong"),);
        }else {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Container( // <--- Change here
                  padding: const EdgeInsets.only(left: 16.0),
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
                    activeFgColor: const Color(0xffE0115F),
                    inactiveBgColor: const Color(0xffF4ACC7),
                    inactiveFgColor: const Color(0xffE0115F),
                    initialLabelIndex: 1,
                    totalSwitches: 2,
                    labels: ['English', '???????????????'],
                    radiusStyle: true,
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                ),
              ],
              backgroundColor: AppColors.pinkColor,
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
                                color: const Color(0xffEFEFEF),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Center(
                                  child: TextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    controller: _phoneNumberController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Container(
                                        //padding: EdgeInsets.symmetric(vertical: 10),
                                        margin: const EdgeInsets.symmetric(horizontal: 8.0,),
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
                                                    child: countryCode?.dialCode == null ? SvgPicture.asset("images/bangladesh.svg") : countryCode!.flagImage,
                                                  ),
                                                  const SizedBox(width: 10,),
                                                  const Icon(
                                                    Icons.arrow_drop_down,
                                                    size: 24,
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                                    decoration: BoxDecoration(
                                                      //color: Colors.black,
                                                      borderRadius: BorderRadius.circular(5),
                                                    ),
                                                    child: Text(
                                                      countryCode?.dialCode ?? "+880",
                                                      style: const TextStyle(color: AppColors.blackColor),
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
                                color: const Color(0xffEFEFEF),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Center(
                                  child: TextField(
                                    controller: _passwordController,
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
                                  child: const Text("Forgot Password?",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),

                                ),
                              ],
                            ),
                            SizedBox(height: deviceHeight * 0.02,),

                            RoundButton(
                              title: "Sign in",
                              buttonColor: AppColors.pinkColor,
                              onPress: (){
                                if(_phoneNumberController.text.isEmpty){
                                  Utils.flushBarErrorMessage("enter your phone number", context);
                                }else if(_passwordController.text.isEmpty){
                                  Utils.snackBar("enter your password", context);
                                }else{
                                  String phoneNumberLogin = "0${_phoneNumberController.text.trim()}";
                                  Map data = {
                                    'mobile' : phoneNumberLogin,
                                    'password' : _passwordController.text.trim().toString(),
                                  };
                                  authViewModelProvider.loginApi(data, context);
                                  if (kDebugMode) {
                                    print("Api Hit");
                                  }
                                }
                              },
                            ),
                            SizedBox(height: deviceHeight * 0.02,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "or",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: deviceHeight * 0.02,),
                            RoundButton(
                              title: "Sign up",
                              buttonColor: AppColors.pinkColor,
                              onPress: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => SignUpPage(),
                                  ),
                                );
                                print("hello working");
                              },
                            ),
                            SizedBox(height: deviceHeight * 0.02,),
                            RoundButton(
                                title: "Sign up with Google",
                                buttonColor: AppColors.orangeColorGoogle,
                                onPress: (){

                                }
                            ),
                            SizedBox(height: deviceHeight * 0.02,),
                            RoundButton(
                                title: "Sign up with Facebook",
                                buttonColor: AppColors.purpleColorFacebook,
                                onPress: (){

                                }
                            ),
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
  /// TODO Login Function
  // void login(String phoneNumberLogin, String passwordLogin) async{
  //   String extraZero = "0";
  //   phoneNumberLogin = extraZero + phoneNumberLogin;
  //   print(phoneNumberLogin);
  //   print(passwordLogin);
  //     try{
  //       Response response = await post(
  //         Uri.parse("http://touch.raisawebcloud.com/api/login"),
  //         body: {
  //           'mobile' : phoneNumberLogin,
  //           'password' : passwordLogin
  //         }
  //       );
  //
  //       if(response.statusCode == 200){
  //         var data = jsonDecode(response.body.toString());
  //         print("Login Successful");
  //         print(data);
  //         print(data['status']);
  //         var statusAccount = data['status'];
  //         var firstName = data['first_name'];
  //         var phone = data['mobile'];
  //
  //
  //         if (statusAccount == 1) {
  //           // inspect(phone);
  //           // inspect(password);
  //           // inspect(statusCode);
  //           final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //           await sharedPreferences.setString("name", firstName.toString());
  //           await sharedPreferences.setInt("status", statusAccount);
  //           //await sharedPreferences.setString("nextloginn", phone.toString());
  //           //Get.offAll(() => const HomePage());
  //           Navigator.pushAndRemoveUntil(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (BuildContext context) =>
  //                       HomePage()),
  //                   (Route<dynamic> route) => false);
  //           //Fluttertoast.showToast(msg: "willkommen");
  //         }
  //         // else if (statusCode == 400) {
  //         //   Fluttertoast.showToast(
  //         //       msg:
  //         //       "Es existiert kein Account mit diesen Daten. Bitte Registrieren.");
  //         // } else if (statusCode == 600) {
  //         //   Fluttertoast.showToast(msg: "Der Account wurde blockiert");
  //         // } else if (statusCode == 700) {
  //         //   Fluttertoast.showToast(
  //         //       msg: "Die Praxis ist bis zum $date geschlossen");
  //         // } else {
  //         //   //debug the responce Status code
  //         //   inspect("loginUser API $statusCode");
  //         //   Fluttertoast.showToast(msg: "Can't proccess request");
  //         // }
  //
  //
  //       }else{
  //         print("Failed");
  //       }
  //
  //     }catch(e){
  //       print(e.toString());
  //     }
  // }

}








