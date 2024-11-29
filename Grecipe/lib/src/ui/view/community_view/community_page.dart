import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/ui/view/community_view/community_recipe_add_page.dart';
import 'package:grecipe/src/ui/view/mypage_view/mypage.dart';
import 'package:grecipe/src/controller/firebase_controller.dart';

class CommunityPage extends StatelessWidget {
  final firebaseController = Get.put(FirebaseCloudFireStoreController());
  int _current = 0;
  final CarouselController _controller = CarouselController();
  CommunityPage({Key? key}) : super(key: key);

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
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: mainColor,
                leading: null,
                floating: true,
                pinned: true,
                snap: false,
                centerTitle: false,
                title: Text(
                  'Grecipe',
                  style:
                      TextStyle(color: subColor, fontWeight: FontWeight.bold),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.location_history),
                    onPressed: () {
                      Get.to(() => const MyPage());
                    },
                  ),
                ],
                bottom: AppBar(
                  shadowColor: mainColor,
                  backgroundColor: mainColor,
                  automaticallyImplyLeading: false,
                  title: Container(
                    width: double.infinity,
                    height: 40,
                    color: Colors.white,
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search for recipe',
                            prefixIcon: Icon(Icons.search, color: mainColor),
                            suffixIcon: IconButton(
                              icon:
                                  Icon(Icons.add_box_rounded, color: mainColor),
                              onPressed: () {
                                Get.to(() => CommunityRecipeAddPage());
                              },
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              // Other Sliver Widgets
              SliverList(
                delegate: SliverChildListDelegate([
                  Center(
                      child: SizedBox(
                          height: displayHeight * 0.35,
                          width: displayWidth * 0.8,
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  child: Text(
                                    'Trendy Recipes',
                                    style: TextStyle(
                                        fontSize: displayHeight * 0.02,
                                        fontWeight: FontWeight.bold),
                                  )),
                              CarouselSlider(
                                  items: imageSliders,
                                  carouselController: _controller,
                                  options: CarouselOptions(
                                      scrollDirection: Axis.horizontal,
                                      enableInfiniteScroll: true,
                                      viewportFraction: 0.6,
                                      autoPlay: true,
                                      autoPlayInterval:
                                          const Duration(milliseconds: 2000),
                                      autoPlayAnimationDuration:
                                          const Duration(milliseconds: 1000),
                                      enlargeCenterPage: true,
                                      aspectRatio: 1.5,
                                      onPageChanged: (index, reason) {
                                        _current = index;
                                      }))

                              /** 
                               Container( // Data from firebase
                                  height: displayHeight * 0.25,
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
                                  child: fireStoreOut('고구마죽')),
                                  **/
                            ],
                          ))),
                  Center(
                      child: Container(
                          width: displayWidth * 0.8,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            'Recent Recipes',
                            style: TextStyle(
                                fontSize: displayHeight * 0.02,
                                fontWeight: FontWeight.bold),
                          ))),
                  Center(

                      /// 한무 스크롤 가능하게
                      child: Container(
                          height: displayHeight * 0.4,
                          width: displayWidth * 0.8,
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemExtent: 100,
                            children: [
                              RecentRecipesList(
                                  'https://spoonacular.com/recipeImages/579247-90x90.jpg',
                                  '딸기 케이크',
                                  '생일용으로 딱이네요',
                                  '2.3k'),
                              RecentRecipesList(
                                  'https://cdn.pixabay.com/photo/2016/04/22/18/52/chicken-soup-1346310_960_720.jpg',
                                  '삼계탕',
                                  '초복 더위는 이걸로 끝',
                                  '3.1k'),
                              RecentRecipesList(
                                  'https://cdn.pixabay.com/photo/2014/01/09/10/14/kimchi-fried-rice-241051_960_720.jpg',
                                  '김치 볶음밥',
                                  '간편하게 10분안에',
                                  '1.2k'),
                              RecentRecipesList(
                                  'https://cdn.pixabay.com/photo/2015/04/06/16/21/korean-food-709606_960_720.jpg',
                                  '쫄면',
                                  '삼겹살과 함께라면',
                                  '5.7k')
                            ],
                          ))),
                ]),
              ),
            ],
          ),
        ));
  }

  FutureBuilder fireStoreOut(rcpName) {
    //추후 carousel slider, on tap적용
    return FutureBuilder(
        future: firebaseController.readData(),
        builder: (_, snapShot) {
          return snapShot.data == null
              ? Container(
                  child: CircularProgressIndicator(),
                )
              : Stack(children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          width: displayWidth * 0.8,
                          child: Image.network(
                            snapShot.data[0].data()['COOKRCP'][rcpName]
                                ['RCPMAINIMAGE'],
                            fit: BoxFit.cover,
                          ))),
                  Positioned.fill(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: displayHeight * 0.06,
                            width: displayWidth * 0.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              color: Colors.white.withOpacity(0.7),
                            ),
                            child: Column(children: [
                              Text(
                                rcpName,
                                style: TextStyle(
                                    fontSize: displayHeight * 0.02,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(snapShot.data[0].data()['COOKRCP'][rcpName]
                                  ['RCP_INTRO'])
                            ]),
                          ))),
                ]);
        });
  }

  Widget RecentRecipesList(url, rcpName, rcpDes, view) {
    return Container(
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: subColor,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(1, 1),
                  color: Colors.black12,
                  blurRadius: 1,
                  spreadRadius: 1)
            ],
            border: Border.all(color: mainColor, width: 2)),
        child: Row(
          children: [
            Container(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: subColor,
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(3, 3),
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 1)
                      ],
                      border: Border.all(color: mainColor, width: 2)),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: displayWidth * 0.2,
                  height: displayWidth * 0.2,
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Container(
                  width: displayWidth * 0.4,
                  height: displayWidth * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        rcpName,
                        style: TextStyle(
                            fontSize: displayHeight * 0.02,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        rcpDes,
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  )),
            ),
            Container(
              child: Container(
                width: displayWidth * 0.1,
                height: displayWidth * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      view,
                      style: TextStyle(
                          fontSize: displayHeight * 0.018,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    Text(
                      'views',
                      style: TextStyle(fontSize: displayHeight * 0.013),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

final List<List> imgList = [
  [
    'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00017_2.png',
    '고구마죽',
    '칼륨 듬뿍 고구마죽'
  ],
  [
    'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00482_2.png',
    '냉파스타',
    '무더운 여름은 이걸로 끝'
  ],
  [
    'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00290_2.png',
    '샤브된장국',
    '10분안에 조리 가능'
  ]
];

final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        margin: const EdgeInsets.all(1.0),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            child: Stack(
              children: <Widget>[
                Image.network(item[0], fit: BoxFit.fitHeight),
                Positioned.fill(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: displayHeight * 0.08,
                          width: displayWidth * 0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            color: Colors.white.withOpacity(0.7),
                          ),
                          child: Column(children: [
                            Text(
                              item[1],
                              style: TextStyle(
                                  fontSize: displayHeight * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(item[2])
                          ]),
                        ))),
              ],
            )),
      ),
    )
    .toList();
