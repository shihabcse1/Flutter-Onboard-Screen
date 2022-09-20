import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Pages/HomePage/home_page.dart';
import '../Repository/auth_repository.dart';
import '../Utils/routes/route_names.dart';
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
      // final userPreference = Provider.of<UserViewModel>(context , listen: false);
      // userPreference.saveUser(
      //     UserModel(
      //         token: value['token'].toString()
      //     )
      // );

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

    _myRepo.signUpApi(data).then((value){
      setSignUpLoading(false);
      Utils.flushBarErrorMessage('SignUp Successfully', context);
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
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){
        print(error.toString());
      }

    });
  }

}