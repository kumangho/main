import 'package:flutter/material.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:get/get.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
    return Container(
      color: mainColor,
      child: SafeArea(
          child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.only(
              top: displayHeight * 0.06,
              bottom: displayHeight * 0.06,
              left: displayWidth * 0.05,
              right: displayWidth * 0.05),
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  width: displayWidth,
                  height: displayHeight * 0.1,
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: displayHeight * 0.05,
                        ),
                      ),
                      Container(
                        child: Text(
                          '$userName 님',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: displayHeight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
              Container(
                  height: displayHeight * 0.2,
                  alignment: Alignment.bottomCenter,
                  width: displayWidth * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          '서비스 알림',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: displayHeight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(),
                      Container(
                          child: ValueBuilder<bool?>(
                              initialValue: false,
                              builder: (isChecked, updateFn) => Switch(
                                    inactiveTrackColor: inactiveColor,
                                    activeTrackColor: mainColor,
                                    activeColor: Colors.white,
                                    value: isSwitched,
                                    onChanged: (newValue) =>
                                        updateFn(isSwitched = newValue),
                                  ))),
                    ],
                  )),
              SizedBox(
                  width: displayWidth * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          '마케팅 알림',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: displayHeight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(),
                      Container(
                          child: ValueBuilder<bool?>(
                              initialValue: false,
                              builder: (isChecked, updateFn) => Switch(
                                    inactiveTrackColor: inactiveColor,
                                    activeTrackColor: mainColor,
                                    activeColor: Colors.white,
                                    value: isSwitched,
                                    onChanged: (newValue) =>
                                        updateFn(isSwitched = newValue),
                                  ))),
                    ],
                  )),
              Container(
                alignment: Alignment.bottomCenter,
                height: displayHeight * 0.1,
                child: Text(
                  '문의하기',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: displayHeight * 0.015,
                      decoration: TextDecoration.underline),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: displayHeight * 0.07,
                child: Text(
                  '로그아웃',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: displayHeight * 0.015,
                      decoration: TextDecoration.underline),
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                    border:
                        Border(top: BorderSide(color: mainColor, width: 1))),
                width: displayWidth * 0.7,
                height: displayHeight * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '탈퇴하기',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: displayHeight * 0.015,
                          decoration: TextDecoration.underline),
                    ),
                    Text(
                      '버전정보 v1.0.0',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: displayHeight * 0.015),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
