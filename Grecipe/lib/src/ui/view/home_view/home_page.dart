import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:grecipe/src/ui/view/home_view/ingredient_add_page.dart';
import 'package:grecipe/src/ui/view/home_view/ingredient_modify_page.dart';
import 'package:grecipe/src/ui/widget/recipe_list.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/controller/shelf_life_index_controller.dart';
import 'package:grecipe/src/controller/recipe_controller.dart';
import 'package:grecipe/src/controller/ingredient_DB_controller.dart';

class HomePage extends StatelessWidget {
  final recipeController = Get.put(RecipeController(), permanent: false);
  final ShelfLifeIndexController _tabx = Get.put(ShelfLifeIndexController());
  final ingDbController = Get.put(IngredientDBController(), permanent: false);

  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: mainColor,
        child: SafeArea(
            bottom: false,
            child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Text(
                    '우리집 냉장고',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: displayHeight * 0.02),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                ),
                body: SingleChildScrollView(
                    child: Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        height: displayHeight * 0.07,
                        width: displayWidth,
                        color: const Color(0xFFF1E7DB),
                        child: CarouselSlider(
                          options: CarouselOptions(
                              height: displayHeight * 0.2,
                              autoPlay: true,
                              viewportFraction: 0.9),
                          items: ['temp3', 'temp4'].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return SizedBox(
                                    width: displayWidth,
                                    child: Image.asset(
                                        'assets/images/banners/$i.png'));
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: displayHeight * 0.06,
                        child: Container(
                          width: displayWidth * 0.8,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '등록된 재료 목록',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: displayHeight * 0.02),
                          ),
                        ),
                      ),
                      Container(
                        width: displayWidth * 0.8,
                        child: Text(
                          'Sort by : life',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: displayHeight * 0.01),
                        ),
                        alignment: Alignment.bottomRight,
                      ),
                      Container(
                        width: displayWidth * 0.8,
                        height: displayHeight * 0.018,
                        child: SizedBox(
                            width: displayWidth * 0.6,
                            child: TabBar(
                                unselectedLabelColor: mainColor,
                                labelPadding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: mainColor),
                                indicatorSize: TabBarIndicatorSize.tab,
                                isScrollable: false,
                                controller: _tabx.controller,
                                tabs: _tabx.myTabs)),
                        alignment: Alignment.bottomLeft,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                      Container(
                        height: 2,
                        width: displayWidth * 0.8,
                        color: mainColor,
                      ),
                      SizedBox(
                          width: displayWidth * 0.8,
                          height: displayHeight * 0.35,
                          child: TabBarView(
                              controller: _tabx.controller,
                              children: [
                                ingGridContainer('good'),
                                ingGridContainer('good'),
                                ingGridContainer('fridged'),
                                ingGridContainer('danger'),
                              ])),
                      Container(
                        margin: EdgeInsets.only(top: displayHeight * 0.02),
                        height: 1,
                        width: displayWidth * 0.8,
                        color: mainColor,
                      ),
                      Container(
                        width: displayWidth * 0.8,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(
                            top: displayHeight * 0.03,
                            bottom: displayHeight * 0.02),
                        child: Text(
                          '추천 레시피 목록',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: displayHeight * 0.02),
                        ),
                      ),
                      recipeList()
                    ],
                  ),
                )))));
  }

  condiCon(index) {
    if (index < ingDbController.dataBox.value.length) {
      return Column(children: [
        Stack(
          children: [
            Container(
              height: displayHeight * 0.066,
              width: displayWidth * 0.16,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: subColor,
                border: Border.all(color: mainColor, width: 2),
              ),
              child: Image(
                image: AssetImage(
                    'assets/images/icons/ingredient_icon/${ingDbController.dataBox.value.values.map((e) => e.ingredientName).toList()[index]}.png'),
              ),
            ),
            Container(
                height: displayHeight * 0.066,
                color: Colors.transparent,
                alignment: Alignment.bottomRight,
                child: Image(
                    image: AssetImage(
                        'assets/images/icons/expiration_icon/${ingDbController.dataBox.value.values.map((e) => e.shelfLife).toList()[index]}.png')))
          ],
        ),
        Container(
            child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(ingDbController.dataBox.value.values
                    .map((e) => e.ingredientName)
                    .toList()[index])
                //dataBox.value.toMap()[index]?.toJson().toString().split(',')[2].substring(24) == '' ? Obx(()=>Text('${dataBox.value.toMap()[index]?.toJson().toString().split(',')[1].substring(17)}')) : Obx(()=>Text('${dataBox.value.toMap()[index]?.toJson().toString().split(',')[2].substring(24)}')),
                ))
      ]);
    }
    return Column(children: [
      Container(
        height: displayHeight * 0.066,
        width: displayWidth * 0.16,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: subColor,
          border: Border.all(color: mainColor, width: 2),
        ),
        child: Icon(
          Icons.add,
          color: mainColor,
        ),
      ),
      Container(
          child: const FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(' '),
      ))
    ]);
  }

  ingGridContainer(life) {
    return Container(
      width: displayWidth * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      margin: EdgeInsets.only(
          left: displayWidth * 0.02, right: displayWidth * 0.02),
      padding: EdgeInsets.only(top: displayHeight * 0.01),
      height: displayHeight * 0.2,
      child: Obx(() => GridView.builder(
          itemCount: ingDbController.dataBox.value.length + 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: displayWidth * 0.02,
              mainAxisExtent: displayHeight * 0.092,
              mainAxisSpacing: displayHeight * 0.02),
          itemBuilder: (BuildContext context, int index) {
            return InkResponse(
              onTap: () {
                selectedIndex = index;
                if (index < ingDbController.dataBox.value.length) {
                  print('item selected');
                  {
                    ingDbController.selectedIcon.value = ingDbController
                        .dataBox.value.values
                        .map((e) => e.ingredientName)
                        .toList()[index];
                    print('$ingDbController.selectedIcon.value');
                    Get.to(() => IngredientModifyPage(),
                        transition: Transition.cupertino);
                  }
                } else if (index == ingDbController.dataBox.value.length) {
                  print('last item selected');
                  {
                    Get.to(() => IngredientAddPage(),
                        transition: Transition.cupertino);
                  }
                }
              },
              child: condiCon(index),
            );
          })),
    );
  }
}
