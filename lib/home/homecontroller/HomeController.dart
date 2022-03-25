import 'package:get/get.dart';
import 'package:user_listing/home/model/user_list.dart';
import 'package:user_listing/home/repo/homerepo.dart';
import 'package:user_listing/service/networkerror.dart';
import 'package:user_listing/themes/constants.dart';

class HomeController extends GetxController {
  var userListResponse = ResponseInfo(responseStatus: Constants.loading).obs;
  var userList = List<UserList>.empty(growable: true).obs;
  var repo = Get.find<HomeRepo>();
  UserList? userlist;

  @override
  void onInit() {
    fetchUserList();
    super.onInit();
  }

  fetchUserList() async {
    print("Entered");

    var result =  await repo.getResult();
    try {
      if(result.error == null) {
        var response = (result.response);
        userList.value = (response);
        userListResponse.value = ResponseInfo(
            responseStatus: Constants.success,
            respCode: 200,
            respMessage: "success");
      } else {
        userListResponse.value = ResponseInfo(
            responseStatus: Constants.error,
            respCode: 400,
            respMessage: "Unable to fetch contacts");
      }
    } catch(e) {
      userListResponse.value = ResponseInfo(
          responseStatus: Constants.error,
          respCode: 400,
          respMessage: "Unable to fetch contacts");
    }
  }
}