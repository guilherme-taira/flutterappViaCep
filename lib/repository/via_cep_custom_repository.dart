import 'package:dio/dio.dart';

class ViaCepCustomRepository{

  var _dio = Dio();

  ViaCepCustomRepository(){
      _dio = Dio();
      _dio.options.headers["X-Parse-Application-Id"] = "3vBCDr0JK2LAiNXpOV4mc9LESr70yVdCusbkBhST";
      _dio.options.headers["X-Parse-REST-API-Key"] = "a9hAobG6rtTLVKPmpEoceDSOxQYCAXYQivyTkGAc";
      _dio.options.headers["Content-Type"] = "application/json";
  }

  Dio get dio => _dio;
}