import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_listing/Detail/view/detailpage.dart';
import 'package:user_listing/home/binding/homebinding.dart';
import 'package:user_listing/home/view/homepage.dart';
import 'package:user_listing/themes/color.dart';

void main() => runApp(
  GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: primary
    ),
    initialRoute: "/home",
    getPages: [
        GetPage(name: "/home", page: () => HomePage(), binding: HomeBinding())
    ],
  )
);


