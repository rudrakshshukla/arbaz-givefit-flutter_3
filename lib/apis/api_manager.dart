import 'package:dio/dio.dart';
import 'package:givefit/src/auth/model/res_filterlist.dart';
import 'package:givefit/src/auth/model/res_login.dart';
import 'dart:convert';
import 'api_end_points.dart';
import 'api_service.dart';
import 'base_model.dart';

class ApiManager{
  final ApiService _apiService = ApiService();

  Future<Res_login> loginUser(FormData req) async {
    try {
      final response = await _apiService.post(
          apiLogin,
        data: req
      );
      var res=json.decode(response.data);
      return Res_login.fromJson(res);
    } on DioError catch (error) {
      throw BaseModel.fromJson(error.response.data);
    }
  }

  Future<Res_login> loginUserFb(FormData req) async {
    try {
      final response = await _apiService.post(
          apiFbLogin,
        data: req
      );
      var res=json.decode(response. data);
      return Res_login.fromJson(res);
    } on DioError catch (error) {
      throw BaseModel.fromJson(error.response.data);
    }}
  

  Future<void> SignInUser(FormData req) async {
    try {
      final response = await _apiService.post(
          apiSignUp,
          data: req
      );
      return Res_login.fromJson(response.data);
    } on DioError catch (error) {
      throw BaseModel.fromJson(error.response.data);
    }
  }

  
  Future<Res_filterlist> getFilterlist(FormData req) async {
    try {
      final response = await _apiService.post(
          apiFilterList,
          data: req
      );
      return Res_filterlist.fromJson(response.data);
    } on DioError catch (error) {
      throw BaseModel.fromJson(error.response.data);
    }
  }


  Future<Res_login> googleSignIn(FormData req) async {
    try {
      final response = await  _apiService.post(
          apiGoogle,
          data: req
      );
      var res=json.decode(response.data);
      return Res_login.fromJson(res);
    } on DioError catch (error) {
      throw BaseModel.fromJson(error.response.data);
    }
  }

}