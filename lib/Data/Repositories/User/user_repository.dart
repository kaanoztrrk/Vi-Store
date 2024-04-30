// ignore_for_file: use_rethrow_when_possible

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Util/Exception/firebase_exceptions.dart';
import '../../../Util/Exception/format_exceptions.dart';
import '../../../Util/Exception/platform_exceptions.dart';
import '../../Model/User/user._model.dart';
import '../Authentication/authentication_repository.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data  to firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw e; // Yakalanan FirebaseException'ı doğrudan yeniden fırlat
    } on FormatException catch (_) {
      throw const ViFormatException();
    } on PlatformException catch (e) {
      throw e; // Yakalanan PlatformException'ı doğrudan yeniden fırlat
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Function to fetch user detailes based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw ViFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ViFormatException();
    } on PlatformException catch (e) {
      throw ViPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Function to  update user data in firestore
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
    } on FirebaseException catch (e) {
      throw ViFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ViFormatException();
    } on PlatformException catch (e) {
      throw ViPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Update any field in specific User Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw ViFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ViFormatException();
    } on PlatformException catch (e) {
      throw ViPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Funtion remove user daya from firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw ViFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ViFormatException();
    } on PlatformException catch (e) {
      throw ViPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Image

  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw ViFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ViFormatException();
    } on PlatformException catch (e) {
      throw ViPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
