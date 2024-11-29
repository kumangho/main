import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/data/model/recipe_model.dart';
import 'package:grecipe/src/controller/food_vision_ing_controller.dart';

Future<Recipes> readJson() async {
  final String response =
      await rootBundle.loadString('assets/json/recipe.json');

  return Recipes.fromJson(json.decode(response));
}

class FoodVisionRecipeController extends GetxController {
  final fvingController = Get.put(FoodVisionIngController(), permanent: false);
  late Future<Recipes> recipe;
  int elementat = 0;
  RxInt fvselectedRecipe = 0.obs;
  RxList fvselectedRecipeIndex = [].obs;
  List<List> fvavaliableRecipe = <List>[];
  List<String> results = [];
  late AsyncSnapshot<Recipes> snapshots = const AsyncSnapshot.nothing();
  recipeFinder() async {
    fvavaliableRecipe.clear();
    fvselectedRecipeIndex.clear();
    for (int i = 0; i < snapshots.data!.COOKRCP02.row.length; i++) {
      // 현재 재료를 레시피 데이터와 비교하여 동일한 레시피 찾기
      int count = 0;
      results =
          snapshots.data!.COOKRCP02.row.elementAt(i).RCPPARTSDTLS.split(',');
      for (int j = 0; j < results.length; j++) {
        for (int k = 0; k < fvingController.fvingResult.length; k++) {
          if (results[j].contains(fvingController.fvingResult[k])) {
            //.value?
            // 추후 every contains로 변경필요
            count++;
            //print('intresult : ' + fvingController.ingResult[k] +'  result length : '+ results.length.toString() +'  count: '+ count.toString());
          }
        }
        if (count == (results.length)) {
          elementat = i;
          fvselectedRecipeIndex.add(elementat);
          fvavaliableRecipe.add([
            ['$elementat'],
            [(snapshots.data!.COOKRCP02.row.elementAt(elementat).RCPNM)],
            [(snapshots.data!.COOKRCP02.row.elementAt(elementat).RCPPARTSDTLS)],
            [(snapshots.data!.COOKRCP02.row.elementAt(elementat).MANUAL01)],
            [(snapshots.data!.COOKRCP02.row.elementAt(elementat).MANUALIMG01)]
          ]);
          update();
          //print('this ${snapshot.toString()}');
        }
      }
    }
    //print(fvavaliableRecipe);
  }

  @override
  void onInit() {
    super.onInit();
    recipe = readJson();
  }
}
