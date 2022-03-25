import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:user_listing/home/model/user_list.dart';
import 'package:user_listing/service/apiresponse.dart';


class HomeRepo extends GetConnect {

  @override
  void onInit() {
    httpClient.timeout=const Duration(seconds: 15);
    super.onInit();
  }

  Future<ApiResponse> getResult() async {
    try {
      var result = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      return ApiResponse.success(userListFromJson(result.body));
    } on SocketException {
      return ApiResponse.error("No Internet");
    }
    on HttpException {
      return ApiResponse.error("Server error");
    }
    on FormatException {
      return ApiResponse.error('Invalid response');
    }
    catch (e) {
      return ApiResponse.error('Unknown error occurred');
    }
  }
}
