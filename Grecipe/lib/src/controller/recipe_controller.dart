import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/data/model/recipe_model.dart';
import 'package:grecipe/src/controller/ingredient_DB_controller.dart';

Future<Recipes> readJson() async {
  final String response =
      await rootBundle.loadString('assets/json/recipe.json');

  return Recipes.fromJson(json.decode(response));
}

class RecipeController extends GetxController {
  final ingDbController = Get.put(IngredientDBController(), permanent: false);
  late Future<Recipes> recipe;
  int elementat = 0;
  RxInt selectedRecipe = 0.obs;
  RxList selectedRecipeIndex = [].obs;
  List<List> avaliableRecipe = <List>[];
  List<String> results = [];
  late AsyncSnapshot<Recipes> snapshots = const AsyncSnapshot.nothing();
  recipeFinder() async {
    avaliableRecipe.clear(); 
    selectedRecipeIndex.clear();
    for (int i = 0; i < snapshots.data!.COOKRCP02.row.length; i++) {
      // 현재 재료를 레시피 데이터와 비교하여 동일한 레시피 찾기
      int count = 0;
      results =
          snapshots.data!.COOKRCP02.row.elementAt(i).RCPPARTSDTLS.split(',');
      for (int j = 0; j < results.length; j++) {
        for (int k = 0; k < ingDbController.ingResult.length; k++) {
          if (results[j].contains(ingDbController.ingResult[k])) {
            // 추후 every contains로 변경필요
            count++;
          }
        }
        if (count == results.length) {
          elementat = i;
          selectedRecipeIndex.add(elementat);
          avaliableRecipe.add([
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
  }

  @override
  void onInit() {
    super.onInit();
    recipe = readJson();
  }

}
