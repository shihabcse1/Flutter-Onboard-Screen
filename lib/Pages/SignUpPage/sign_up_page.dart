import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen/Pages/LoginPage/login_page.dart';
import 'package:flutter_onboarding_screen/Pages/VerificationPage/verification_page.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int _value = 1;
  var _isVisible1 = false;
  var _isVisible2 = false;


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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                //height: deviceHeight * 0.68,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                //color: Colors.red,
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
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'test@gmail.com',
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
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'test@gmail.com',
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
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'test@gmail.com',
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
                                hintText: 'Password',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                              value: 1,
                              groupValue: _value,
                              onChanged: (value){
                                setState(() {
                                  //_value = value;
                                });
                              }
                          ),
                          //SizedBox(width: 5.0,),
                          Text("NID"),
                          Radio(
                              value: 2,
                              groupValue: _value,
                              onChanged: (value){

                              }
                          ),
                          //SizedBox(width: 5.0,),
                          Text("Birth Certificate"),
                        ],
                      ),
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
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'test@gmail.com',
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
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'test@gmail.com',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: deviceHeight * 0.02,),
                      Container(
                        width: double.infinity,
                        height: 48.0,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => VerificationPage(),
                              ),
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
}

