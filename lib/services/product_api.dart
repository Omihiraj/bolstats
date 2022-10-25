import 'dart:convert';
import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductApi {
  static Future<List<Product>> getOpenProducts(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/data/open-products.json');
    final body = json.decode(data);

    return body.map<Product>(Product.fromJson).toList();
  }

  static Future<List<Product>> getSentProducts(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/data/sent-products.json');
    final body = json.decode(data);

    return body.map<Product>(Product.fromJson).toList();
  }
}
