import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen/Pages/SignUpPage/sign_up_page.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                height: deviceHeight * 0.68,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                //color: Colors.red,
                child: LayoutBuilder(builder: (ctx, constraints){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sign In",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      //SizedBox(height: constraints.maxHeight * 0.078,),
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
                      SizedBox(height: 0.3,),
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
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 0.3,),
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
                      Container(
                        width: double.infinity,
                        height: 48.0,
                        margin: EdgeInsets.only(
                          top: 16.0,
                        ),
                        child: ElevatedButton(
                          onPressed: (){},
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("or"),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 48.0,
                        margin: EdgeInsets.only(
                          top: 16.0,
                        ),
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SignUpPage(),
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
                      Container(
                        width: double.infinity,
                        height: 48.0,
                        margin: EdgeInsets.only(
                          top: 16.0,
                        ),
                        child: ElevatedButton(
                          onPressed: (){},
                          child: Text(
                            "Sign up with Google",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffDE5246),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 48.0,
                        margin: EdgeInsets.only(
                          top: 16.0,
                        ),
                        child: ElevatedButton(
                          onPressed: (){},
                          child: Text(
                            "Sign up with Facebook",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff4267B2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
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
