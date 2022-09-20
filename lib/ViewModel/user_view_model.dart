import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/user_model.dart';

class UserViewModel with ChangeNotifier{

  Future<bool> saveUser(UserModel user)async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('first_name', user.firstName.toString());
    sp.setString('mobile', user.mobile.toString());
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true ;
  }

  Future<UserModel> getUser()async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? firstName = sp.getString('first_name');
    final String? mobile = sp.getString('mobile');
    final String? token = sp.getString('token');

    return UserModel(
      firstName: firstName.toString(),
      mobile: mobile.toString(),
      token: token.toString()
    );
  }

  Future<bool> remove()async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('first_name');
    sp.remove('mobile');
    sp.remove('token');
    return true;

  }
}