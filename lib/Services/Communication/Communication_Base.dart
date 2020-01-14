import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lobevent/main.dart';

class Communication_Base{
  Dio client;
  FlutterSecureStorage storage;
  Communication_Base(){
    this.storage = new FlutterSecureStorage();
    this.client = new Dio();

  }

  void addTokenHeader() async{
    String token  = await storage.read(key: "JWT");
    this.client.options.headers["Authorization"] = "Bearer $token";
  }



  ///
  ///
  Future<Response> makeRequestAndHandleErrors(Function requestFunction) async{
    Response response;
    try{
      response = await requestFunction();
    }on DioError catch(e){
      int statusCode = e.response.statusCode;
      switch(statusCode){
        case 401: navigatorKey.currentState.pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false); break;
        case 402: break;
        case 404: break;
        case 500: break;
      }
    }
    return response;

  }
  //dynamic HandleError(response) async
}