import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toggle_switch/toggle_switch.dart';

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

        ],
      ),
    );
  }
}

class DigitInputVerification extends StatelessWidget {
  const DigitInputVerification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      width: 48.0,
      decoration: BoxDecoration(
        color: Color(0xffEFEFEF),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Center(
        child: TextField(
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
    );
  }
}
