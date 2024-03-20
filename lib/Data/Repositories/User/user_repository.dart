import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Util/Exception/firebase_exceptions.dart';
import '../../../Util/Exception/format_exceptions.dart';
import '../../../Util/Exception/platform_exceptions.dart';
import '../../Model/User/user._model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data  to firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      return _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw ViFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ViFormatException();
    } on PlatformException catch (e) {
      throw ViPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
