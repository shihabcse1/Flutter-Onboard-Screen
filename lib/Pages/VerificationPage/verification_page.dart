import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:toggle_switch/toggle_switch.dart';
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

  @override
  Widget build(BuildContext context) {
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
              DigitInputVerification(),
              DigitInputVerification(),
              DigitInputVerification(),
              DigitInputVerification(),
              DigitInputVerification(),
              DigitInputVerification(),
              SizedBox(width: deviceWeight * 0.03,),
            ],
          ),
          ButtonVerify(deviceHeight: deviceHeight, deviceWeight: deviceWeight),
          SizedBox(height: deviceHeight * 0.03,),
          RichTextComponent(),

        ],
      ),
    );
  }


  void checkOTP(String phoneNumber, String otp) async{
    //print(phoneNumberLogin);
    //print(passwordLogin);
    try{
      Response response = await post(
          Uri.parse("http://touch.raisawebcloud.com/api/check_otp"),
          body: {
            'mobile' : phoneNumber,
            'otp' : otp,
          }
      );

      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print("OTP Checked Successfully");
        print(data);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => VerificationPage(verificationPhoneNumber: phoneNumberRegistration),
        //   ),
        // );
      }else{
        print("Failed");
      }

    }catch(e){
      print(e.toString());
    }
  }


}







