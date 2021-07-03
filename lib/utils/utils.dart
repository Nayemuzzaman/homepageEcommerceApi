import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  Widget builtImageContainer(String imageName, double circle) {
    String imageUrl = "";

    if (imageName != null && imageName.length > 0) {
      imageUrl = "$imageName";
    }

    bool _validURL = Uri.parse(imageUrl).isAbsolute;

    try {
      return Container(
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: (_validURL && imageUrl.length > 0)
                ? CachedNetworkImage(
              imageUrl: imageUrl,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(circle),
                  ),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                  padding: EdgeInsets.all(0),
                  child: Center(child: CupertinoActivityIndicator())),
              errorWidget: (context, url, error) => Container(
                  height: 25,
                  width: 25,
                  margin: EdgeInsets.all(0),
                  child:
                  Image.asset("")),
            )
                : Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
              
                image: DecorationImage(
                    image:
                    AssetImage(""),
                    fit: BoxFit.cover),
              ),
            ),
          ));
    } catch (error) {
      return Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(2),
          ),
          border: Border(
            top:
            BorderSide(width: 1.0, color: Colors.white),
            left:
            BorderSide(width: 1.0, color: Colors.white),
            right:
            BorderSide(width: 1.0, color: Colors.white),
            bottom:
            BorderSide(width: 1.0, color: Colors.white),
          ),
          image: DecorationImage(
              image: AssetImage(""),
              fit: BoxFit.cover),
        ),
      );
    }
  }

  Widget emptyScreenPlaceholder() {
    return Center(
      child: Text(
        "",
        style: TextStyle(
            fontSize: 25.0, color: Colors.red, fontWeight: FontWeight.normal),
      ),
    );
  }
}