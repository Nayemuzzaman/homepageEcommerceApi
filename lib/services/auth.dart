import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:ecommerce_homepage_api/models/trendingSellersModel.dart';
import 'package:ecommerce_homepage_api/services/response.dart';
import 'package:ecommerce_homepage_api/utils/apis.dart';

import 'repo.dart';

class AuthServices {
  // ignore: missing_return
  Future<Responses> trendingSellersAllData() async {
    Response response;
    Dio client = Dio();
    try {
      response = await client.post(APIs.trendingSellersAPI);

      if (response.statusCode == 200) {
        List<TrendingSellersModel> trendingSellerList = [];
        response.data[0].forEach((v) {
          trendingSellerList.add(new TrendingSellersModel.fromJson(v));
        });

        return Responses(object: trendingSellerList);
      } else {}
    } catch (error) {
      print("error");
    }
  }
}
