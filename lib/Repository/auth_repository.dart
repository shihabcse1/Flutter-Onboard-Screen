import '../DataRepository/network/BaseApiServices.dart';
import '../DataRepository/network/NetworkApiSerivice.dart';
import '../Resources/app_url.dart';

class AuthRepository  {

  BaseApiServices _apiServices = NetworkApiService() ;

  Future<dynamic> loginApi(dynamic data )async{

    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginApiEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data )async{

    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }

}