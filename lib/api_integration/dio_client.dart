import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fuego/api_integration/user_info_list_response.dart';
import 'package:fuego/api_integration/user_info_response_put.dart';
import 'package:fuego/api_integration/user_response.dart';
import 'package:fuego/api_integration/userinfo.dart';
import 'package:fuego/api_integration/userinfo_body.dart';

class DioClient {
  final Dio dio = Dio();

  final baseUrl = 'https://reqres.in/api';
// this method will be used to get UserInfo
  Future<UserInfo> getUser(String id) async {
    Response userData = await dio.get('$baseUrl/users/$id');
    // debugPrint('userinfo ${userData.data}');
    UserInfo userInfo = UserInfo.fromJson(userData.data);
    debugPrint('userinfo ${userInfo.data?.firstName}');
    debugPrint('userinfo ${userInfo.data?.lastName}');
    debugPrint('userinfo ${userInfo.data?.email}');
    debugPrint('userinfo ${userInfo.support?.text}');
    return userInfo;
  }

// this method will be used to create a new user
  Future<Userresponse?> createUser(Userinfobody userInfoBody) async {
    Userresponse? retrievedUser;

    Response response = await dio.post(
      '$baseUrl/users',
      options: Options(headers: {
        'Content-Type': 'application/json',
      }),
      data: Userinfobody(name: userInfoBody.name, job: userInfoBody.job),
    );

    debugPrint('User created: ${response.data}');

    retrievedUser = Userresponse.fromJson(response.data);

    return retrievedUser;
  }

// this method will return list of users
  Future<UserInfoListResponse> getUserList() async {
    Response? userData;
    try {
      userData = await dio.get('$baseUrl/users');
      if (userData.statusCode == 200) {
        debugPrint('Users Data: ${userData.data}');
        return UserInfoListResponse.fromJson(userData.data);
      } else {
        throw Exception('failed to load User');
      }
    } catch (e) {
      debugPrint('error ${e.toString()}');
    }
    return UserInfoListResponse.fromJson(userData?.data);
  }

  Future<UserInfoResponsePut?> updateuser(
      int id, Userinfobody userInfoBody) async {
    UserInfoResponsePut? retrievedUser;

    try {
      Response response = await dio.put(
        '$baseUrl/users/$id',
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
        data: Userinfobody(name: userInfoBody.name, job: userInfoBody.job),
      );
      if (response.statusCode == 201) {
        retrievedUser = UserInfoResponsePut.fromJson(response.data);
        debugPrint('User Updated: ${response.data}');
      } else {
        throw Exception('failed to load User');
      }
    } catch (e) {
      debugPrint('error $e');
    }

    return retrievedUser;
  }
}
