/*

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


import '../../../Features/Store/Models/category_model.dart';
import '../../../Util/Exception/firebase_exceptions.dart';
import '../../../Util/Exception/platform_exceptions.dart';
import '../../../Util/Service/vi_firebase_storage_sevice.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Get all Categories

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.formSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw ViFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw ViPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Get Sub Categories

  // Upload Categories to the cloud firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // uploadall the categories alog with their Images
      final storage = Get.put(ViFirebaseStorageSerice());

      // Loop through each category
      for (var category in categories) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        final url =
            await storage.uploadImageData('Categories', file, category.name);

        // assing  URL to Category.image attribute
        category.image = url;

        await _db
            .collection('Categories')
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw ViFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw ViPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}

 */