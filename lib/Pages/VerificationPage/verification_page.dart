import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'components/richtext_component.dart';
import 'components/verification_input_field.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

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
              activeBgColors: [[Color(0xffFFFFFF)!], [Color(0xffFFFFFF)!],],
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
              //color: Color(0xffE0115F),
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
          Container(
            width: double.infinity,
            height: 48.0,
            margin: EdgeInsets.only(
              top: deviceHeight * 0.02,
              left: deviceWeight * 0.03,
              right: deviceWeight * 0.03,
            ),
            child: ElevatedButton(
              onPressed: (){},
              child: Text(
                "Verify",
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
          SizedBox(height: deviceHeight * 0.03,),
          RichTextComponent(),

        ],
      ),
    );
  }
}






