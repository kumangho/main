import 'package:flutter/material.dart';

Color mainColor = const Color(0xffFFBA7D);
Color subColor = const Color(0xffFFFAF5);
Color textfieldColor = const Color(0xffFFEEE0);
Color inactiveColor = const Color(0xFFB88558);
double displayHeight = 0;
double displayWidth = 0;
double displayRatio = 1;
int selectedIndex = 0;
String userName = '';
String shelfLife = 'good';
TextEditingController ingname = TextEditingController();
TextEditingController ingmemo = TextEditingController();

BoxShadow mainColorShadow = BoxShadow(
  color: mainColor.withOpacity(0.5),
  spreadRadius: 3,
  blurRadius: 5,
  offset: const Offset(0, 3), // changes position of shadow
);

List ingList_vegetable = [
  '양배추',
  '당근',
  '마늘',
  '파',
  '버섯',
  '양파',
  '고추',
  '깻잎',
  '피망',
  '감자',
  '고구마',
  '콩나물'
]; //채소
List ingList_fruit = ['옥수수', '쌀']; //과일,견과, 쌀
List ingList_fisheries = ['참치']; //수산, 해산, 건어물
List ingList_meat = ['소고기', '닭고기', '달걀', '돼지고기']; //축산물(정육, 계란)
List ingList_seasoning = ['올리브유', '소금', '설탕', '간장', '식초', '후추']; //양념, 오일
List ingList_processedfood = [
  '베이컨',
  '빵',
  '버터',
  '치즈',
  '어묵',
  '햄',
  '김치',
  '우유',
  '김',
  '파스타',
  '라면',
  '소시지',
  '두부'
]; //면, 가공식품
List ingList_beverage = ['물']; //물

final List<String> ingList_en = <String>[
  'soy_sauce',
  'potato',
  'sweet_potato',
  'pepper',
  'nori',
  'kimchi',
  'perilla_leaf',
  'egg',
  'chicken',
  'carrot',
  'pork',
  'ramen',
  'garlic',
  'water',
  'mushroom',
  'butter',
  'bacon',
  'bread',
  'sugar',
  'beef',
  'salt',
  'sausage',
  'vinegar',
  'rice',
  'cabbage',
  'onion',
  'fish_cake',
  'corn',
  'olive_oil',
  'milk',
  'tuna',
  'cheese',
  'green_onion',
  'pasta',
  'pimento',
  'ham',
  'black_pepper',
  'sprouts',
  'tofu'
];
final List<String> ingList_ko = <String>[
  '간장',
  '감자',
  '고구마',
  '고추',
  '김',
  '김치',
  '깻잎',
  '달걀',
  '닭고기',
  '당근',
  '돼지고기',
  '라면',
  '마늘',
  '물',
  '버섯',
  '버터',
  '베이컨',
  '빵',
  '설탕',
  '소고기',
  '소금',
  '소시지',
  '식초',
  '쌀',
  '양배추',
  '양파',
  '어묵',
  '옥수수',
  '올리브유',
  '우유',
  '참치',
  '치즈',
  '파',
  '파스타',
  '피망',
  '햄',
  '후추',
  '콩나물',
  '두부'
];
