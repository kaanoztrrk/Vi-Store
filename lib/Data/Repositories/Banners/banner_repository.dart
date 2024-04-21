import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Data/Model/Banner/banner_model.dart';
import 'package:ecommerce_app/Util/Exception/firebase_exceptions.dart';
import 'package:ecommerce_app/Util/Exception/format_exceptions.dart';
import 'package:ecommerce_app/Util/Exception/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Get all order reelated to current User

  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();
      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw ViFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ViFormatException();
    } on PlatformException catch (e) {
      throw ViPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Banners';
    }
  }

  // Upload Banner to the cloud firebase
}
