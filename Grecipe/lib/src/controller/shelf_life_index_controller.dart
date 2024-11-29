import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:grecipe/src/data/list.dart';

class ShelfLifeIndexController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(child:
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: mainColor)),
            child: const Text('      ALL      ')))),
    Tab(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: mainColor)),
            child: Row(
      children: [
        const Padding(padding: EdgeInsets.only(left: 5)),
        Image.asset(
          "assets/images/icons/expiration_icon/good_1.png",
          height: 10,
          width: 10,
        ),
        const Padding(padding: EdgeInsets.only(right: 5)),
        const Text('7 items'),
        const Padding(padding: EdgeInsets.only(right: 5)),
      ],
    )))),
    Tab(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: mainColor)),
            child: Row(
      children: [
        const Padding(padding: EdgeInsets.only(left: 5)),
        Image.asset(
          "assets/images/icons/expiration_icon/fridged_1.png",
          height: 10,
          width: 10,
        ),
        const Padding(padding: EdgeInsets.only(right: 5)),
        const Text('2 items'),
        const Padding(padding: EdgeInsets.only(right: 5)),
      ],
    )))),
    Tab(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                               border: Border.all(color: mainColor),),
            child: Row(
      children: [
        const Padding(padding: EdgeInsets.only(left: 5)),
        Image.asset(
          "assets/images/icons/expiration_icon/danger_1.png",
          height: 10,
          width: 10,
        ),
        const Padding(padding: EdgeInsets.only(right: 5)),
        const Text('2 items'),
        const Padding(padding: EdgeInsets.only(right: 5))
      ],
    )))),
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
