import 'package:flutter/material.dart';
import 'package:grecipe/src/controller/shelf_life_controller.dart';
import 'package:grecipe/src/controller/ingredient_DB_controller.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/ui/widget/landing_page.dart';
import 'package:grecipe/src/ui/widget/ingredient_add_icons.dart';

class IngredientAddPage extends StatelessWidget {
  final shelfLifeController = Get.put(ShelfLifeController(), permanent: false);
  final ingDbController = Get.put(IngredientDBController(), permanent: false);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
      child: SafeArea(
          bottom: false,
          child: Container(
            color: Colors.white,
            child: Scaffold(
              appBar: AppBar(
                leading: BackButton(
                  color: mainColor,
                  onPressed: () {
                    Get.back();
                  },
                ),
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0,
                title: const Text(
                  '식재료 등록',
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.black),
                ),
              ),
              body: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Container(
                          height: displayHeight * 0.15,
                          width: displayWidth * 0.8,
                          padding: EdgeInsets.only(top: displayHeight * 0.03),
                          child: SizedBox(
                              height: displayHeight * 0.2,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: const Text('이름 입력'),
                                        padding: EdgeInsets.only(
                                            bottom: displayHeight * 0.01),
                                      ),
                                      Container(
                                        child: Container(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              color: textfieldColor,
                                            ),
                                            width: displayWidth * 0.34,
                                            height: displayHeight * 0.06,
                                            child: TextFormField(
                                              controller: ingname,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: '이름을 입력하세요.',
                                                hintStyle: TextStyle(
                                                    fontSize:
                                                        displayHeight * 0.013),
                                              ),
                                            )),
                                      )
                                    ],
                                  )),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            bottom: displayHeight * 0.01),
                                        alignment: Alignment.centerLeft,
                                        child: const Text('아이콘으로 등록하기'),
                                      ),
                                      InkResponse(
                                          onTap: () {
                                            ingredientAddIconsDialog();
                                          },
                                          child: Container(
                                            height: displayHeight * 0.06,
                                            width: displayHeight * 0.06,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              color: subColor,
                                              border: Border.all(
                                                  color: mainColor, width: 2),
                                            ),
                                            child: Obx(
                                              () => Image(
                                                  image: AssetImage(
                                                      'assets/images/icons/ingredient_icon/${ingDbController.selectedIcon.value}.png')),
                                            ),
                                          ))
                                    ],
                                  ))
                                ],
                              )))),
                  Center(
                      child: SizedBox(
                    width: displayWidth * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: const Text('유통기한 설정'),
                          padding:
                              EdgeInsets.only(bottom: displayHeight * 0.01),
                        ),
                        Container(
                          height: displayHeight * 0.06,
                          padding:
                              EdgeInsets.only(bottom: displayHeight * 0.03),
                          child: Obx(() => ToggleButtons(
                              borderRadius: BorderRadius.circular(20),
                              borderWidth: 2,
                              borderColor: mainColor,
                              selectedBorderColor: mainColor,
                              color: mainColor,
                              hoverColor: mainColor,
                              selectedColor: mainColor,
                              focusColor: mainColor,
                              fillColor: mainColor,
                              children: [
                                Image.asset(
                                  "assets/images/icons/expiration_icon/good_1.png",
                                  height: 20,
                                  width: 20,
                                ),
                                Image.asset(
                                  "assets/images/icons/expiration_icon/danger_1.png",
                                  height: 20,
                                  width: 20,
                                ),
                                Image.asset(
                                  "assets/images/icons/expiration_icon/fridged_1.png",
                                  height: 20,
                                  width: 20,
                                ),
                              ],
                              onPressed: (int index) {
                                shelfLifeController.changeTabIndex(index);
                              },
                              isSelected:
                                  shelfLifeController.isSelected.toList())),
                        ),
                      ],
                    ),
                  )),
                  Center(
                      child: SizedBox(
                    width: displayWidth * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(bottom: displayHeight * 0.01),
                          child: const Text('메모'),
                        ),
                        Container(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: textfieldColor,
                            ),
                            width: displayWidth * 0.8,
                            height: displayHeight * 0.2,
                            child: TextFormField(
                              controller: ingmemo,
                              minLines: 1,
                              maxLines: 5,
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: '내용을 입력하세요.',
                              ),
                            )),
                      ],
                    ),
                  )),
                  Padding(
                    padding: EdgeInsets.only(top: displayHeight * 0.2),
                  ),
                  Center(
                      child: Container(
                          child: TextButton(
                              onPressed: () => {
                                    ingDbController.createIng(),
                                    ingDbController.readIng(selectedIndex),
                                    Get.to(() => LandingPage(),
                                        transition: Transition.cupertino)
                                  },
                              child: Text(
                                '등록하기',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: displayHeight * 0.02),
                              ))))
                ],
              )),
            ),
          )),
    );
  }
}
