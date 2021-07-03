import 'dart:async';

import 'package:ecommerce_homepage_api/models/trendingSellersModel.dart';
import 'package:ecommerce_homepage_api/services/repo.dart';
import 'package:ecommerce_homepage_api/services/response.dart';

class TrendingSellerBloc {

  List<TrendingSellersModel> _trendingSellersModel = []; //model list


  final _trendingSellerListStreamController = StreamController<List<TrendingSellersModel>>.broadcast();


  _trendingSellerListApiResponse() async {

    Responses responses = await repository.trendingSellersAllData();

    if(responses.object!=null){
      _trendingSellersModel = responses.object;
      _trendingSellerListStreamController.add(_trendingSellersModel);
    } else{
      _trendingSellerListStreamController.add(_trendingSellersModel);
    }

  }

  Stream<List<TrendingSellersModel>> get trendingSellerListStream =>
      _trendingSellerListStreamController.stream;

  StreamSink<List<TrendingSellersModel>> get trendingSellerListSink =>
      _trendingSellerListStreamController.sink;


  TrendingSellerBloc() {
    _trendingSellerListApiResponse();

  }


  //Dispose all stream builder

  void dispose(){
    _trendingSellerListStreamController.close();
  }




}