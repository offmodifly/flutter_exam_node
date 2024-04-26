import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_node_store/services/dio_config.dart';
import 'package:flutter_node_store/utils/utility.dart';

class CallAPI {

  // สร้าง Dio Instance
  final Dio _dio = DioConfig.dio;

  // Register API
  registerAPI(data) async {
    // Check Network Connection
    if(await Utility.checkNetwork() == ''){
      return jsonEncode(
        {'message': 'No Network Connection'}
      );
    }else{
      try {
        final response = await _dio.post('auth/register', data: data);
        Utility().logger.d(response.data);
        return jsonEncode(response.data);
      } catch (e) {
        Utility().logger.e(e);
      }
    }
  }

  //Login API
  loginAPI(data) async{
    //check Network Connection
    if(await Utility.checkNetwork()==''){
      return jsonEncode({'message': 'No Network Connection'});
    }else{
      try {
        final response = await _dio.post('auth/login',data: data);
        Utility().logger.d(response.data);
        return jsonEncode(response.data);
      } catch (e) {
        Utility().logger.e(e);
      }
    }
  }

}