import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen/Pages/VerificationPage/verification_page.dart';
import 'package:flutter_onboarding_screen/ViewModel/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/user_model.dart';
import '../Pages/HomePage/home_page.dart';
import '../Repository/auth_repository.dart';
import '../Utils/utils.dart';
import 'package:flutter/foundation.dart';


class AuthViewModel with ChangeNotifier {

  final _myRepo = AuthRepository();

  bool _signInLoading = false;
  bool get singInLoading => _signInLoading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;


  setLoading(bool value){
    _signInLoading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value){
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data , BuildContext context) async {

    setLoading(true);

    _myRepo.loginApi(data).then((value){
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context , listen: false);
      userPreference.saveUser(
          UserModel(
            firstName: value['first_name'].toString(),
            mobile: value['mobile'].toString(),
            token: value['token'].toString(),
          )
      );

      Utils.flushBarErrorMessage('Login Successfully', context);
      // Navigator.pushNamed(context, RoutesName.home);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => HomePage(),
        ),
      );
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace){
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){
        print(error.toString());
      }

    });
  }


  Future<void> signUpApi(dynamic data , BuildContext context) async {

    setSignUpLoading(true);

    _myRepo.signUpApi(data).then((value) async {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage('SignUp Successfully', context);



      // final userPreference = Provider.of<UserViewModel>(context , listen: false);
      // userPreference.saveUser(
      //     UserModel(
      //       firstName: value['first_name'].toString(),
      //       mobile: value['user_data']['first_name'].toString()),
      //       token: value['token'].toString(),
      //     )
      // );

      print("This is value" + value.toString());
      print("This is userdata" + value['user_data'].toString());
      print("This is userName" + value['user_data']['first_name'].toString());
      print("This is Status" + value['status'].toString());
      // Navigator.pushNamed(context, RoutesName.home);

      ////////////////////////////////////////////////////////

      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString("first_name", value['user_data']['first_name'].toString());
      await sharedPreferences.setString("mobile", value['user_data']['mobile'].toString());
      await sharedPreferences.setString("status", value['status'].toString());
      String verificationPhoneNumber = value['user_data']['mobile'].toString();

      ///////////////////////////////////////////////////

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VerificationPage(verificationPhoneNumber: verificationPhoneNumber),
        ),
      );
      if(kDebugMode){
        print(value.toString());

      }
    }).onError((error, stackTrace){
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){
        print(error.toString());
      }
    });
  }

  Future<void> verifyOtpApi(dynamic data , BuildContext context) async {

    //setSignUpLoading(true);

    _myRepo.verifyOtpApi(data).then((value) async {
      //setSignUpLoading(false);
      Utils.flushBarErrorMessage('SignUp Successfully', context);



      // final userPreference = Provider.of<UserViewModel>(context , listen: false);
      // userPreference.saveUser(
      //     UserModel(
      //       firstName: value['first_name'].toString(),
      //       mobile: value['user_data']['first_name'].toString()),
      //       token: value['token'].toString(),
      //     )
      // );

      // Navigator.pushNamed(context, RoutesName.home);

      ////////////////////////////////////////////////////////


      ///////////////////////////////////////////////////

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => HomePage(),
        ),
      );
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace){
      // setSignUpLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){
        print(error.toString());
      }

    });
  }

}