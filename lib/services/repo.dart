

import 'package:ecommerce_homepage_api/services/auth.dart';
import 'package:ecommerce_homepage_api/services/response.dart';

class Repository {
  final AuthServices _operatorAuthServices = AuthServices();

  Future<Responses> trendingSellersAllData() =>
      _operatorAuthServices.trendingSellersAllData();


}

final repository = Repository();