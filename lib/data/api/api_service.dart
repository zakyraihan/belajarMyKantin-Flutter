import 'dart:convert';
import 'dart:developer';

import 'package:belajar_mykantin/data/model/model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://belajar-react.smkmadinatulquran.sch.id/api';

  final Dio dio = Dio();

  Future getKategori() async {
    try {
      final String url = '$_baseUrl/category/all';

      final response = await dio.get(url);
      if (response.statusCode == 200) {
        // print('data --->> $response');
        var data = kategoriFromJson(jsonEncode(response.data));
        return data.data;
      }
    } catch (e) {
      log('Error ->>> $e');
    }
  }

  Future getPopular() async {
    try {
      final String url = '$_baseUrl/populer/all';

      final response = await dio.get(url);
      if (response.statusCode == 200) {
        print('data --->> $response');
        var data = popularFromJson(jsonEncode(response.data));
        return data.data;
      }
    } catch (e) {
      log('Error ->>> $e');
    }
  }
}
