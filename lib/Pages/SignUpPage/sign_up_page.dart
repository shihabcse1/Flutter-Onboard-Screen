import 'dart:convert';
import 'dart:io';

import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen/Pages/LoginPage/login_page.dart';
import 'package:flutter_onboarding_screen/Pages/VerificationPage/verification_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:http/http.dart';

import 'components/text_field_email.dart';
import 'components/text_field_full_name.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();


  //--------------------------------

  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;

  var _isVisible1 = false;
  var _isVisible2 = false;
  String _selectedValidCard = 'nid';
  File? imageFileFront;
  File? imageFileBack;

  @override
  Widget build(BuildContext context) {

    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWeight = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(   // <--- Change here
            padding: EdgeInsets.only(left: 16.0), // <-- play with the double number
            child: Image.asset("images/logo.png",scale: 2,)
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
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: LayoutBuilder(builder: (ctx, constraints){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: deviceHeight * 0.05,),
                      Text("Sign Up",
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
                              controller: fullNameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Full Name',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: deviceHeight * 0.01,),
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
                                          final code = await countryPicker.showPicker(context: context);
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
                      SizedBox(height: deviceHeight * 0.01,),
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
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              maxLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'mdhasansridoy@gmail.com',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: deviceHeight * 0.01,),
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
                              obscureText: _isVisible1 ? false : true,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      _isVisible1 = !_isVisible1;
                                    });
                                  },
                                  icon: Icon(
                                    _isVisible1 ? Icons.visibility : Icons.visibility_off,
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
                      Container(
                        width: double.infinity,
                        //height: constraints.maxHeight * 0.09,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: Color(0xffEFEFEF),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Center(
                            child: TextField(
                              controller: passwordConfirmController,
                              obscureText: _isVisible2 ? false : true,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      _isVisible2 = !_isVisible2;
                                    });
                                  },
                                  icon: Icon(
                                    _isVisible2 ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),
                                border: InputBorder.none,
                                hintText: 'Confirm Password',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                              value: 'nid',
                              groupValue: _selectedValidCard,
                              onChanged: (value){
                                setState(() {
                                  _selectedValidCard = value.toString();
                                });
                              }
                          ),
                          //SizedBox(width: 5.0,),
                          Text("NID"),
                          Radio(
                              value: 'birth',
                              groupValue: _selectedValidCard,
                              onChanged: (value){
                                setState(() {
                                  _selectedValidCard = value.toString();
                                });
                              }
                          ),
                          //SizedBox(width: 5.0,),
                          Text("Birth Certificate"),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          _attachNIDImageFileFront();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          height: 48.0,
                          decoration: BoxDecoration(
                              color: Color(0xffEFEFEF),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "images/icon_attach_file.svg",
                                      color: imageFileFront == null ? Colors.black : Color(0xffE0115F),
                                    ),
                                    Text(
                                      '  Attach NID Front',
                                      style: TextStyle(
                                        color: imageFileFront == null ? Colors.black : Color(0xffE0115F),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ), // <-- Text
                              imageFileFront == null ? SizedBox() : Icon( // <-- Icon
                                Icons.check,
                                size: 24.0,
                                color: Color(0xffE0115F),
                              ),
                            ],
                          ),

                        ),
                      ),
                      SizedBox(height: deviceHeight * 0.01,),
                      GestureDetector(
                        onTap: (){
                          _attachNIDImageFileBack();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          height: 48.0,
                          decoration: BoxDecoration(
                              color: Color(0xffEFEFEF),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "images/icon_attach_file.svg",
                                      color: imageFileBack == null ? Colors.black : Color(0xffE0115F),
                                    ),
                                    Text(
                                      '  Attach NID Back',
                                      style: TextStyle(
                                        color: imageFileBack == null ? Colors.black : Color(0xffE0115F),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ), // <-- Text
                              imageFileBack == null ? SizedBox() : Icon( // <-- Icon
                                Icons.check,
                                size: 24.0,
                                color: Color(0xffE0115F),
                              ),
                            ],
                          ),

                        ),
                      ),
                      SizedBox(height: deviceHeight * 0.02,),
                      Container(
                        width: double.infinity,
                        height: 48.0,
                        child: ElevatedButton(
                          onPressed: (){
                            registration(
                                fullNameController.text.trim().toString(),
                                phoneNumberController.text.trim().toString(),
                                emailController.text.trim().toString(),
                                passwordController.text.trim().toString(),
                            );
                          },
                          child: Text(
                            "Sign Up",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => LoginPage(),
                                ),
                              );
                            },
                            child: Text("Already have a account?",
                              style: TextStyle(
                                color: Color(0xffE0115F),
                              ),
                            ),
                          ),
                        ],
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


  void registration(String fullName, String phoneNumberRegistration, String email, String password) async{
    String extraZero = "0";
    phoneNumberRegistration = extraZero + phoneNumberRegistration;
    //print(phoneNumberLogin);
    //print(passwordLogin);
    try{
      Response response = await post(
          Uri.parse("http://touch.raisawebcloud.com/api/register"),
          body: {
            'first_name' : fullName,
            'mobile' : phoneNumberRegistration,
            'password' : password,
            'email' : email,
          }
      );

      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print("Account Created Successfully");
        print(data);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VerificationPage(),
          ),
        );
      }else{
        print("Failed");
      }

    }catch(e){
      print(e.toString());
    }
  }


  void _attachNIDImageFileFront() async{
    final pathfile = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      imageFileFront = File(pathfile!.path);
      //movie.image = imageFile!.path;
    });
  }

  void _attachNIDImageFileBack() async{
    final pathfile = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      imageFileBack = File(pathfile!.path);
      //movie.image = imageFile!.path;
    });
  }

}





