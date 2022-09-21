import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onboarding_screen/Resources/components/round_button.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../ViewModel/auth_view_model.dart';
import 'components/button_verify.dart';
import 'components/richtext_component.dart';
import 'components/verification_input_field.dart';

class VerificationPage extends StatefulWidget {
  String verificationPhoneNumber;
  VerificationPage({required this.verificationPhoneNumber, Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {

  TextEditingController _firstController = TextEditingController();
  TextEditingController _secondController = TextEditingController();
  TextEditingController _thirdController = TextEditingController();
  TextEditingController _forthController = TextEditingController();
  TextEditingController _fifthController = TextEditingController();
  TextEditingController _sixthController = TextEditingController();

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _forthController.dispose();
    _fifthController.dispose();
    _sixthController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final authViewModelProvider = Provider.of<AuthViewModel>(context);
    final deviceWeight = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

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
      body: Column(
        children: [
          SizedBox(height: deviceHeight * 0.1,),
          Text(
            "Verify Phone Number",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: deviceHeight * 0.01,),
          Text(
            "A 6 digit code has been sent to your phone number.",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: deviceHeight * 0.06,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: deviceWeight * 0.03,),
              Container(
                height: 48.0,
                width: 48.0,
                decoration: BoxDecoration(
                  color: Color(0xffEFEFEF),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: TextField(
                    controller: _firstController,
                    onChanged: (value){
                      if (value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                height: 48.0,
                width: 48.0,
                decoration: BoxDecoration(
                  color: Color(0xffEFEFEF),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: TextField(
                    controller: _secondController,
                    onChanged: (value){
                      if (value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                height: 48.0,
                width: 48.0,
                decoration: BoxDecoration(
                  color: Color(0xffEFEFEF),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: TextField(
                    controller: _thirdController,
                    onChanged: (value){
                      if (value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                height: 48.0,
                width: 48.0,
                decoration: BoxDecoration(
                  color: Color(0xffEFEFEF),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: TextField(
                    controller: _forthController,
                    onChanged: (value){
                      if (value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                height: 48.0,
                width: 48.0,
                decoration: BoxDecoration(
                  color: Color(0xffEFEFEF),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: TextField(
                    controller: _fifthController,
                    onChanged: (value){
                      if (value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                height: 48.0,
                width: 48.0,
                decoration: BoxDecoration(
                  color: Color(0xffEFEFEF),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: TextField(
                    controller: _sixthController,
                    onChanged: (value){
                      if (value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(width: deviceWeight * 0.03,),
            ],
          ),
          //ButtonVerify(deviceHeight: deviceHeight, deviceWeight: deviceWeight),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: RoundButton(
              title: "Verify",
              onPress: (){
                String otp = _firstController.text.toString()
                    + _secondController.text.toString()
                    + _thirdController.text.toString()
                    + _forthController.text.toString()
                    + _fifthController.text.toString()
                    + _sixthController.text.toString();
                print("otp : "+otp);
                Map data = {
                  'mobile' : widget.verificationPhoneNumber.toString(),
                  'otp' : otp.toString(),
                };
                authViewModelProvider.verifyOtpApi(data, context);
                print("Api Hit");
              }
            ),
          ),
          SizedBox(height: deviceHeight * 0.03,),
          RichTextComponent(),

        ],
      ),
    );
  }


  // void checkOTP(String phoneNumber, String otp) async{
  //   //print(phoneNumberLogin);
  //   //print(passwordLogin);
  //   try{
  //     Response response = await post(
  //         Uri.parse("http://touch.raisawebcloud.com/api/check_otp"),
  //         body: {
  //           'mobile' : phoneNumber,
  //           'otp' : otp,
  //         }
  //     );
  //
  //     if(response.statusCode == 200){
  //       var data = jsonDecode(response.body.toString());
  //       print("OTP Checked Successfully");
  //       print(data);
  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(
  //       //     builder: (_) => VerificationPage(verificationPhoneNumber: phoneNumberRegistration),
  //       //   ),
  //       // );
  //     }else{
  //       print("Failed");
  //     }
  //
  //   }catch(e){
  //     print(e.toString());
  //   }
  // }


}







