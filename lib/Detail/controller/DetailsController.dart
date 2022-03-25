import 'package:get/get.dart';
import 'package:user_listing/home/model/user_list.dart';
import 'package:user_listing/home/repo/homerepo.dart';
import 'package:user_listing/service/networkerror.dart';
import 'package:user_listing/themes/constants.dart';

class DetailsController extends GetxController {
  var userListResponse = ResponseInfo(responseStatus: Constants.loading).obs;

  var repo = Get.find<HomeRepo>();
  UserList? userlist;

  fetchUserList() async {
    var userDetail = Get.arguments;

    try {
    if(userDetail != null) {
      userlist = userDetail;
      userListResponse.value = ResponseInfo(
          responseStatus: Constants.success,
          respCode: 200,
          respMessage: "success");
    }
     else {
        userListResponse.value = ResponseInfo(
            responseStatus: Constants.error,
            respCode: 400,
            respMessage: "Unable to fetch details");
      }
    } catch(e) {
      userListResponse.value = ResponseInfo(
          responseStatus: Constants.error,
          respCode: 400,
          respMessage: "Unable to fetch details");
    }
  }
}