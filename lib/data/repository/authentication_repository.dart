import 'package:auro/features/authentication/model/user_detail.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../utils/local_storage/storage_utility.dart';
import '../../utils/preferences/cache_manager.dart';
import '../http/http_client.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  static const String _userDataKey = 'user_data';
  final TLocalStorage _localStorage = TLocalStorage();

  ///----User Login
  Future<Map<String, dynamic>> userLogin(
      String mobileNumber, String password) async {
    try {
      Map<String, dynamic> data = {
        'user_mobile': mobileNumber,
        "user_pass": password
      };
      Map<String, dynamic> response =
          await THttpHelper.post('user_login', data);

      if (kDebugMode) {
        print('user_login Response: $response');
      }

      if (response['response'] == 'success') {
        List<dynamic> userDataList = response['user'];

        /// SetData in Model...
        if (userDataList.isNotEmpty) {
          Map<String, dynamic> userData = userDataList.first;
          UserDetail user = UserDetail.fromJson(userData);
          _localStorage.saveData(_userDataKey, user.toJson());

          SharedPrefs.setBool("isLoggedIn", true);

          return {'success': true, 'message': 'Logged in successfully'};
        } else {
          return {'success': false, 'message': 'User data is empty'};
        }
      } else {
        // Error occurred, return response
        return {'success': false, 'message': response['message']};
      }
    } catch (e) {
      return {'response': 'error', 'message': e.toString()};
    }
  }

  ///-----Register User
  Future<Map<String, dynamic>> registerUser(
      String companyName, fullName, mobileNumber, emailAddress,userPassword) async {
    try {
      Map<String, dynamic> data = {
        'user_company': companyName,
        'user_name': fullName,
        'user_mobile': mobileNumber,
        'user_email': emailAddress,
        'user_pass':userPassword,
      };
      Map<String, dynamic> response =
          await THttpHelper.post('signup_user', data);

      if (kDebugMode) {
        print('signup_user Response: $response');
      }

      if (response['response'] == 'success') {


        List<dynamic> userDataList = response['data'];

        /// SetData in Model...
        if (userDataList.isNotEmpty) {
          Map<String, dynamic> userData = userDataList.first;
          UserDetail user = UserDetail.fromJson(userData);
          _localStorage.saveData(_userDataKey, user.toJson());

          return {'success': true, 'message': 'User Registered Successfully'};
        } else {
          return {'success': false, 'message': 'User data is empty'};
        }
      } else {
        // Error occurred, return response
        return {'success': false, 'message': response['message']};
      }
    } catch (e) {
      return {'response': 'error', 'message': e.toString()};
    }
  }

  ///-----Send OTP
  Future<Map<String, dynamic>> sendOtp(
      mobileNumber) async {
    try {
      Map<String, dynamic> data = {
        'user_mobile': mobileNumber
      };
      Map<String, dynamic> response =
      await THttpHelper.post('send_otp', data);

      if (kDebugMode) {
        print('send_otp Response: $response');
      }

      if (response['response'] == 'success') {

        return {'success': true, 'message': 'OTP Send Successfully'};
      } else {
        // Error occurred, return response
        return {'success': false, 'message': response['message']};
      }
    } catch (e) {
      return {'response': 'error', 'message': e.toString()};
    }
  }

  ///-----Verify  OTP
  Future<Map<String, dynamic>> verifyOtp(
      userId,otp) async {
    try {
      Map<String, dynamic> data = {
        'user_id': userId,
        'otp': otp,

      };
      Map<String, dynamic> response =
      await THttpHelper.post('verify_otp', data);

      if (kDebugMode) {
        print('verify_otp Response: $response');
      }

      if (response['response'] == 'success') {

        return {'success': true, 'message': 'OTP Send Successfully'};
      } else {
        // Error occurred, return response
        return {'success': false, 'message': response['message']};
      }
    } catch (e) {
      return {'response': 'error', 'message': e.toString()};
    }
  }

}
