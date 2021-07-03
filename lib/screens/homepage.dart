import 'package:ecommerce_homepage_api/blocs/TrendingSellersBloc.dart';
import 'package:ecommerce_homepage_api/models/trendingSellersModel.dart';
import 'package:ecommerce_homepage_api/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> with WidgetsBindingObserver {
  final TrendingSellerBloc _trendingSellerBloc = TrendingSellerBloc();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Container(
          child: Column(
        children: [ TrendingSellers()],
          ),
        )
    );
  }

  // ignore: non_constant_identifier_names
  Widget TrendingSellers() {

    return Card(
      elevation: 4.0,
      child: Container(
        height: 195,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text( "Trending Seller", style: TextStyle(color:Colors.black , fontSize: 16, fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 15,),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder<List<TrendingSellersModel>>(
                  stream: _trendingSellerBloc.trendingSellerListStream,
                  builder: (BuildContext context, AsyncSnapshot<List<TrendingSellersModel>> snapshot) {
                    if (!snapshot.hasData) {
                      return Utils().emptyScreenPlaceholder();
                    } else {
                      return (snapshot.data.length > 0)
                          ? Container(
                          child: ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return  AllTrendingSeller(snapshot.data[index]);
                            },
                          ))
                          : Utils().emptyScreenPlaceholder();
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

   // ignore: non_constant_identifier_names
   Widget AllTrendingSeller(TrendingSellersModel trendingSellersModel){
    return Card(
      elevation: 1.0,
      child: Container(
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 150,
                width: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Utils().builtImageContainer("${trendingSellersModel.sellerItemPhoto}", 0.0),
              ),

              Positioned(
                top: 6,
                left: 6,
                child:  Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFe0f2f1),
                  ),
                  child: Utils().builtImageContainer("${trendingSellersModel.sellerProfilePhoto}", 17.0),
                ),
              ),
              Container(
                height: 35,
                width: 110,
                decoration:BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.only(
                      bottomRight:Radius.circular(8),
                      bottomLeft: Radius.circular(8)
                  )
                ) ,
                child: Text("${trendingSellersModel.sellerName}", textAlign: TextAlign.center, style: TextStyle(color:Colors.white, fontSize: 14),),
              )
            ],
          )
        ],
      ),
    ),);
  }

}
