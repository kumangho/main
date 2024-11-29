import 'package:get/get.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:hive/hive.dart';
import 'package:grecipe/src/data/model/ingredient.dart';

class IngredientDBController extends GetxController {
var dataBox = Hive.box<DataModel>('dbs').obs;
List<String> ingResult = Hive.box<DataModel>('dbs').values.map((e) => e.ingredientName).toList();
final List<String> ingResult1 = <String>[
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
  '후추'
];

  RxString selectedIcon = '달걀'.obs;
  createIng() {
    DataModel data = DataModel(
            index: dataBox.value.length,
            ingredientName: selectedIcon.value,
            userSpecIngredientName: ingname.text,
            shelfLife: shelfLife,
            memo: ingmemo.text);
    dataBox.value.add(data);
    //print('added data is ${data.index}, ${data.ingredientName}, ${data.userSpecIngredientName}, ${data.shelfLife}, ${data.memo}');
    //print('db length: ${dataBox.length}');
    //readAllIng();
    ingResult =  Hive.box<DataModel>('dbs').values.map((e) => e.ingredientName).toList();
    print(ingResult);
    update();
  }

  readIng(index) {
    print('db created');
    print('this ${dataBox.value.values.map((e) => e.index).toList()[index]}');
    print('this ${dataBox.value.values.map((e) => e.ingredientName).toList()[index]}');
    print('this ${dataBox.value.values.map((e) => e.userSpecIngredientName).toList()[index]}');
    print('this ${dataBox.value.values.map((e) => e.shelfLife).toList()[index]}');
    print('this ${dataBox.value.values.map((e) => e.memo).toList()[index]}');
  }

  readAllIng(){
    for (var element in dataBox.value.values) { 
      print('all DB : ${element.index}, ${element.ingredientName}, ${element.userSpecIngredientName}, ${element.shelfLife}, ${element.memo}');
    }
  }
  
  updateIng(index) async {
    DataModel data = DataModel(
            index: index,
            ingredientName: selectedIcon.value,
            userSpecIngredientName: ingname.text,
            shelfLife: shelfLife,
            memo: ingmemo.text);
    dataBox.value.putAt(index, data);
    ingResult =  Hive.box<DataModel>('dbs').values.map((e) => e.ingredientName).toList();
    print('db updated $data');
    //print('db length: ${dataBox.length}');
    update();
  }

  deleteIng(index) async {
    dataBox.value.deleteAt(index);
    print('db deleted');
    ingResult =  Hive.box<DataModel>('dbs').values.map((e) => e.ingredientName).toList();
    //print('db length: ${dataBox.length}');
    //sorting
    //dbSort();
    update();
  }

  dbSort(){
    dataBox.value.values.toList().sort((a,b){
      return a.ingredientName.compareTo(b.ingredientName);
    });
    update();
  }


}
