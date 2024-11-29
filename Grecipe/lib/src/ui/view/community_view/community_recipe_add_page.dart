import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:grecipe/src/controller/community_recipe_add_controller.dart';

class CommunityRecipeAddPage extends StatelessWidget {
  final rcpAddController = CommunityRecipeAddController();

  CommunityRecipeAddPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              leading: BackButton(
                color: mainColor,
                onPressed: () {
                  Get.back();
                },
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.check,
                      color: mainColor,
                    ))
              ],
            ),
            body: CustomScrollView(slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.black12,
                stretch: true,
                expandedHeight: displayHeight * 0.2,
                flexibleSpace: FlexibleSpaceBar(
                    background: Obx(() => InkWell(
                        onTap: () {
                          rcpAddController.pickImage(ImageSource.gallery);
                        },
                        child: rcpAddController.selectedImagePath.value == ''
                            ? Center(
                                child: Text(
                                '+',
                                style: TextStyle(
                                    fontSize: displayHeight * 0.2,
                                    color: Colors.white),
                              ))
                            : Image.file(File(
                                rcpAddController.selectedImagePath.value))))),
              ),
              SliverList(
                  delegate: SliverChildListDelegate(
                [
                  Container(
                    height: displayHeight * 0.8,
                    width: displayWidth * 0.8,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.only(top: 10),
                            width: displayWidth * 0.8,
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                SizedBox(
                                    width: displayWidth * 0.2,
                                    child: Text('글 제목',
                                        style: TextStyle(
                                            fontSize: displayHeight * 0.02,
                                            fontWeight: FontWeight.bold))),
                                Container(
                                    width: displayWidth * 0.59,
                                    height: displayHeight * 0.05,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        color: subColor,
                                        boxShadow: const [
                                          BoxShadow(
                                              offset: Offset(3, 3),
                                              color: Colors.black12,
                                              blurRadius: 5,
                                              spreadRadius: 1)
                                        ],
                                        border: Border.all(
                                            color: mainColor, width: 2)),
                                    child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: const TextField(
                                            decoration: InputDecoration(
                                          hintText: ' ex) 요리 레시피 ep1',
                                          border: InputBorder.none,
                                        ))))
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.only(top: 10),
                            width: displayWidth * 0.8,
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Container(
                                    height: displayHeight * 0.1,
                                    width: displayWidth * 0.2,
                                    child: Text('요리 소개',
                                        style: TextStyle(
                                            fontSize: displayHeight * 0.02,
                                            fontWeight: FontWeight.bold))),
                                Container(
                                    width: displayWidth * 0.59,
                                    height: displayHeight * 0.1,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        color: subColor,
                                        boxShadow: const [
                                          BoxShadow(
                                              offset: Offset(3, 3),
                                              color: Colors.black12,
                                              blurRadius: 5,
                                              spreadRadius: 1)
                                        ],
                                        border: Border.all(
                                            color: mainColor, width: 2)),
                                    child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: const TextField(
                                            minLines: 1,
                                            maxLines: 5,
                                            keyboardType:
                                                TextInputType.multiline,
                                            decoration: InputDecoration(
                                              hintText:
                                                  ' ex) 요리 레시피 ep1 입니다. 쉽고 빠르게 맛있는 요리를 조리해보세요!',
                                              border: InputBorder.none,
                                            ))))
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.only(top: 10),
                            width: displayWidth * 0.8,
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                SizedBox(
                                    width: displayWidth * 0.2,
                                    child: Text('요리 제목',
                                        style: TextStyle(
                                            fontSize: displayHeight * 0.02,
                                            fontWeight: FontWeight.bold))),
                                Container(
                                    width: displayWidth * 0.59,
                                    height: displayHeight * 0.05,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        color: subColor,
                                        boxShadow: const [
                                          BoxShadow(
                                              offset: Offset(3, 3),
                                              color: Colors.black12,
                                              blurRadius: 5,
                                              spreadRadius: 1)
                                        ],
                                        border: Border.all(
                                            color: mainColor, width: 2)),
                                    child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: const TextField(
                                            decoration: InputDecoration(
                                          hintText: ' ex) 김치 볶음밥',
                                          border: InputBorder.none,
                                        ))))
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.only(top: 10),
                            width: displayWidth * 0.8,
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                SizedBox(
                                    width: displayWidth * 0.2,
                                    child: Text('재료 추가',
                                        style: TextStyle(
                                            fontSize: displayHeight * 0.02,
                                            fontWeight: FontWeight.bold))),
                                Container(
                                    width: displayWidth * 0.29,
                                    height: displayHeight * 0.05,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        color: subColor,
                                        boxShadow: const [
                                          BoxShadow(
                                              offset: Offset(3, 3),
                                              color: Colors.black12,
                                              blurRadius: 5,
                                              spreadRadius: 1)
                                        ],
                                        border: Border.all(
                                            color: mainColor, width: 2)),
                                    child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: const TextField(
                                            decoration: InputDecoration(
                                          hintText: ' ex) 김치',
                                          border: InputBorder.none,
                                        )))),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: displayWidth * 0.01)),
                                Container(
                                    width: displayWidth * 0.29,
                                    height: displayHeight * 0.05,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        color: subColor,
                                        boxShadow: const [
                                          BoxShadow(
                                              offset: Offset(3, 3),
                                              color: Colors.black12,
                                              blurRadius: 5,
                                              spreadRadius: 1)
                                        ],
                                        border: Border.all(
                                            color: mainColor, width: 2)),
                                    child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: const TextField(
                                            decoration: InputDecoration(
                                          hintText: ' ex) 150g',
                                          border: InputBorder.none,
                                        )))),
                              ],
                            )),
                        //AddRcpParts(),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        SizedBox(
                          width: displayWidth * 0.8,
                          child: Row(
                            children: [
                              SizedBox(
                                width: displayWidth * 0.2,
                              ),
                              Container(
                                  width: displayWidth * 0.59,
                                  height: displayHeight * 0.05,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color: subColor,
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(3, 3),
                                            color: Colors.black12,
                                            blurRadius: 5,
                                            spreadRadius: 1)
                                      ],
                                      border: Border.all(
                                          color: mainColor, width: 2)),
                                  child: ElevatedButton(
                                    onPressed: () => {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(mainColor),
                                    ),
                                    child: Text('+',
                                        style: TextStyle(
                                            fontSize: displayHeight * 0.02,
                                            fontWeight: FontWeight.bold)),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.only(top: 10),
                            width: displayWidth * 0.8,
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                SizedBox(
                                    width: displayWidth * 0.2,
                                    child: Text('양념 추가',
                                        style: TextStyle(
                                            fontSize: displayHeight * 0.02,
                                            fontWeight: FontWeight.bold))),
                                Container(
                                    width: displayWidth * 0.29,
                                    height: displayHeight * 0.05,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        color: subColor,
                                        boxShadow: const [
                                          BoxShadow(
                                              offset: Offset(3, 3),
                                              color: Colors.black12,
                                              blurRadius: 5,
                                              spreadRadius: 1)
                                        ],
                                        border: Border.all(
                                            color: mainColor, width: 2)),
                                    child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: const TextField(
                                            decoration: InputDecoration(
                                          hintText: ' ex) 간장',
                                          border: InputBorder.none,
                                        )))),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: displayWidth * 0.01)),
                                Container(
                                    width: displayWidth * 0.29,
                                    height: displayHeight * 0.05,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        color: subColor,
                                        boxShadow: const [
                                          BoxShadow(
                                              offset: Offset(3, 3),
                                              color: Colors.black12,
                                              blurRadius: 5,
                                              spreadRadius: 1)
                                        ],
                                        border: Border.all(
                                            color: mainColor, width: 2)),
                                    child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: const TextField(
                                            decoration: InputDecoration(
                                          hintText: ' ex) 1/2T',
                                          border: InputBorder.none,
                                        )))),
                              ],
                            )),
                        //AddRcpSources(),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        SizedBox(
                          width: displayWidth * 0.8,
                          child: Row(
                            children: [
                              SizedBox(
                                width: displayWidth * 0.2,
                              ),
                              Container(
                                  width: displayWidth * 0.59,
                                  height: displayHeight * 0.05,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color: subColor,
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(3, 3),
                                            color: Colors.black12,
                                            blurRadius: 5,
                                            spreadRadius: 1)
                                      ],
                                      border: Border.all(
                                          color: mainColor, width: 2)),
                                  child: ElevatedButton(
                                    onPressed: () => {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(mainColor),
                                    ),
                                    child: Text('+',
                                        style: TextStyle(
                                            fontSize: displayHeight * 0.02,
                                            fontWeight: FontWeight.bold)),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          width: displayWidth * 0.8,
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Text('레시피 추가',
                              style: TextStyle(
                                  fontSize: displayHeight * 0.02,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                            width: displayWidth * 0.8,
                            height: displayHeight * 0.1,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(3, 3),
                                      color: Colors.white,
                                      blurRadius: 5,
                                      spreadRadius: 1)
                                ],
                                border: Border.all(color: mainColor, width: 2)),
                            child: Row(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(left: 5)),
                                Container(
                                  width: displayHeight * 0.08,
                                  height: displayHeight * 0.08,
                                  decoration: const BoxDecoration(
                                      color: Colors.black12),
                                  child: Center(
                                      child: Text(
                                    '+',
                                    style: TextStyle(
                                        fontSize: displayHeight * 0.05,
                                        color: Colors.white),
                                  )),
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(left: 6)),
                                Container(
                                  padding: const EdgeInsets.only(top: 5),
                                  width: displayWidth * 0.55,
                                  height: displayHeight * 0.08,
                                  child: const TextField(
                                      minLines: 1,
                                      maxLines: 5,
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        hintText: ' ex) 김치를 쫑쫑 썰어 넣고 밥을 준비해주세요',
                                        border: InputBorder.none,
                                      )),
                                )
                              ],
                            )),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        Container(
                          width: displayWidth * 0.8,
                          height: displayHeight * 0.05,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: subColor,
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(3, 3),
                                    color: Colors.black12,
                                    blurRadius: 5,
                                    spreadRadius: 1)
                              ],
                              border: Border.all(color: mainColor, width: 2)),
                          child: ElevatedButton(
                            onPressed: () => {},
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(mainColor),
                            ),
                            child: Text('+',
                                style: TextStyle(
                                    fontSize: displayHeight * 0.02,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ))
            ])));
  }
}
