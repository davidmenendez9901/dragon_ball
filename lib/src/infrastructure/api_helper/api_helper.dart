import 'package:dio/dio.dart';
import 'package:dragon_ball/src/infrastructure/models/character_model.dart';

class ApiHelper {
  static String baseURL = 'http://dragonball-api.com/api';
  Future<List<Character>> getCharactersList() async {
    var response = await Dio().get(
      '$baseURL/characters',
      queryParameters: {
        'limit':20,
      },
    );

    return List.generate(response.data['items'].length,
        (e) => Character().fromMap(response.data['items'][e]));
  }
}
