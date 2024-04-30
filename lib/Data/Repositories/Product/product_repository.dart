import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Util/Exception/firebase_exceptions.dart';
import 'package:ecommerce_app/Util/Exception/platform_exceptions.dart';
import 'package:ecommerce_app/Util/Service/vi_firebase_storage_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Features/Store/Models/product_model.dart';
import '../../../Util/Constant/enums.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  // FireStore instance for database interactions
  final _db = FirebaseFirestore.instance;

  // get limited featured product
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      // Firebase hatalarını daha spesifik bir şekilde işle
      throw ViFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      // Platform hatalarını daha spesifik bir şekilde işle
      throw ViPlatformException(e.code).message;
    } catch (e) {
      // Diğer hataları daha spesifik bir şekilde işle
      // Örneğin, network hatası, veritabanı hatası gibi...
      print(e);
      throw 'Something went wrong: $e';
    }
  }

  // Upload dummy data to the cloud firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      // upload all the product along with their images
      final storage = Get.put(ViFirebaseStorageSerice());

      // loop through each product
      for (var product in products) {
        // get images data link from local assets
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        product.thumbnail = url;

        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];

          for (var image in product.images!) {
            // get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            final url = await storage.uploadImageData(
                'Product/Images', assetImage, image);

            imagesUrl.add(url);

            product.images!.clear();
            product.images!.addAll(imagesUrl);
          }

          // upload Variadation Images

          if (product.productType == ProductType.variable.toString()) {
            for (var variation in product.productVariations!) {
              // Get Images data link from local assets
              final assetImage =
                  await storage.getImageDataFromAssets(variation.image);

              // Upload image and get its Url
              final url = await storage.uploadImageData(
                  'Products/Images', assetImage, variation.image);

              // assing URL to variation.image attribute
              variation.image = url;
            }
          }
        }
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
