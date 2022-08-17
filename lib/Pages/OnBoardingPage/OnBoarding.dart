import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'components/button_get_started.dart';
import 'content_model.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWeight = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
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
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
                onPageChanged: (int index){
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_ , i){
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        Text(
                          contents[i].title!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffE0115F),
                          ),
                        ),
                        SizedBox(height: 20,),
                        SvgPicture.asset(
                          contents[i].image!,
                          height: 300,
                        ),
                      ],
                    ),
                  );
                }
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  contents.length,
                      (index) => buildDot(index, context),
              ),
            ),
          ),
          ButtonGetStarted(currentIndex: currentIndex, controller: _controller),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
       height: 10,
       width: 10,
       margin: EdgeInsets.only(right: 5),
       decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index ? Color(0xffE0115F) : Color(0xffEFEFEF),
       ),
    );
  }
}


