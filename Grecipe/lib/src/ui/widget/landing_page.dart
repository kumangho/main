import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/controller/bottom_navigation_controller.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:grecipe/src/ui/view/community_view/community_page.dart';
import 'package:grecipe/src/ui/view/mypage_view/mypage.dart';
import 'package:grecipe/src/ui/view/home_view/home_page.dart';
import 'package:grecipe/src/ui/view/foodvision_view/food_vision_page.dart';

class LandingPage extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: displayHeight * 0.08,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: subColor,
            unselectedItemColor: mainColor.withOpacity(0.5),
            selectedItemColor: mainColor,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Icon(
                      Icons.home,
                      size: displayHeight * 0.02,
                    ),
                  ),
                  label: 'fridge'),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Icon(
                      Icons.remove_red_eye,
                      size: displayHeight * 0.02,
                    ),
                  ),
                  label: 'food vision'),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Icon(
                      Icons.people,
                      size: displayHeight * 0.02,
                    ),
                  ),
                  label: 'Community'),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Icon(
                      Icons.location_history,
                      size: displayHeight * 0.02,
                    ),
                  ),
                  label: 'Mypage'),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarController landingPageController =
        Get.put(BottomNavigationBarController(), permanent: false);
    return Container(
        color: mainColor,
        child: SafeArea(
            bottom: false,
            child: Scaffold(
              bottomNavigationBar:
                  buildBottomNavigationMenu(context, landingPageController),
              body: Obx(() => IndexedStack(
                    index: landingPageController.tabIndex.value,
                    children: [
                      HomePage(),
                      FoodVision(),
                      CommunityPage(),
                      const MyPage()
                    ],
                  )),
            )));
  }
}
