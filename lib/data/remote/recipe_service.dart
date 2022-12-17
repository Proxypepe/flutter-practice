import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';

import 'model/full_recipe.dart';

class RecipeService {
  static const _BASE_URL = "http://10.0.2.2:8000";


  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL)
  );

  RecipeService() {
    _dio.interceptors.add(dioLoggerInterceptor);
  }

  Future<List<FullRecipe>> getRecipes () async {
    final response = await _dio.get('/api/v1/recipes');
    List<FullRecipe> result = [];
    for (var n in response.data) {
      result.add(FullRecipe.fromJson(n));
    }
    return result;
  }

}