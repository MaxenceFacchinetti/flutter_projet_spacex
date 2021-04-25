import 'package:dio/dio.dart';
import 'package:flutter_projet_facchinetti/lancement.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {

  Dio dio;

  ApiManager(){
    dio = Dio();
    dio.options = BaseOptions(baseUrl: "https://api.spacexdata.com/v4");
  }

   Future<Response<List<dynamic>>> getLancements() async =>
    await dio.get<List<dynamic>>("/launches/upcoming");

  Future<Response<List<dynamic>>> getLancementsHistorique() async =>
      await dio.get<List<dynamic>>("/launches/past");

}