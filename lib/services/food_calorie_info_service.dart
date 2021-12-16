import 'package:calorie_tracker/models/fetched_food_info.dart';
import 'package:calorie_tracker/models/food_items.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FoodCalorieInfoService {
  static Future<FetchedFoodInfo> fetchFoodCalorieValue(
      List<String> foodItems) async {
    FetchedFoodInfo fetchedFoodInfo =
        FetchedFoodInfo(foodItems: [], totalCalories: 0);
    String combinedFoodItems = "";
    Response? response;
    for (var foodItem in foodItems) {
      combinedFoodItems += "$foodItem ";
    }

    try {
      Options options = Options(headers: {
        "x-app-id": dotenv.env['X_APP_ID'],
        "x-app-key": dotenv.env['X_APP_KEY'],
        "Content-Type": "application/json"
      });
      await dotenv.load(fileName: ".env");
      response = await Dio().post(
        "https://trackapi.nutritionix.com/v2/natural/nutrients",
        data: '{"query":"$combinedFoodItems","timezone": "US/Eastern"}',
        options: options,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    if (response?.statusCode == 200) {
      final foodItems = FoodItems.fromMap(response?.data);
      foodItems.foods?.forEach((food) {
        fetchedFoodInfo.foodItems
            .add(GetUtils.capitalize(food.foodName ?? '') ?? '');
        fetchedFoodInfo.totalCalories +=
            double.tryParse(food.nfCalories?.toString() ?? '0')?.toInt() ?? 0;
      });
    }

    return fetchedFoodInfo;
  }
}
