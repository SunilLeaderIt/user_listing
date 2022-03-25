import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_listing/Detail/controller/DetailsController.dart';
import 'package:user_listing/themes/constants.dart';


class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = DetailsController();
    controller.fetchUserList();
    return Obx(() {
      if (controller.userListResponse.value.responseStatus ==
          Constants.loading) {
        return Center(child: CircularProgressIndicator());
      } else if (controller.userListResponse.value.responseStatus ==
          Constants.success) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Users List"),
          ),
          body: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(controller.userlist?.name ?? ""),
                SizedBox(height: 15,),
                Text(controller.userlist?.website ?? ""),
                SizedBox(height: 15,),
                Text(controller.userlist?.phone ?? ""),
                SizedBox(height: 15,),
                Text(controller.userlist?.email ?? ""),
                SizedBox(height: 15,),

              ],
            ),
          ),
        );
      }
      return Container();
    });
  }
}