import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_listing/Detail/view/detailpage.dart';
import 'package:user_listing/home/homecontroller/HomeController.dart';
import 'package:user_listing/home/model/user_list.dart';
import 'package:user_listing/themes/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
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
          body: ListView.builder(
              itemCount: controller.userList.length,
              itemBuilder: (context, index) {
                return getCard(controller.userList[index]);
              }),
        );
      }
      return Container();
    });
  }

  Widget getCard(UserList item) {
    return InkWell(
      onTap: () {
        Get.to(DetailPage(), arguments: item);
      },
      child: Card(
        elevation: 1.5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                        child: Text(item.username ?? "",
                          style: TextStyle(fontSize: 17),)),
                    SizedBox(height: 10,),
                    Text(
                      item.phone ?? "", style: TextStyle(color: Colors.grey),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}




