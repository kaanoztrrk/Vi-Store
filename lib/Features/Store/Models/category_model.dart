import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFetured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFetured,
    this.parentId = '',
  });

  // Emty Helper Fonction
  static CategoryModel empty() =>
      CategoryModel(id: '', name: '', image: '', isFetured: false);

  // Convert model to Json structure so that you can store data in firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFetured,
    };
  }

  // Map Json oriented document snapshot from firebasr to user model
  factory CategoryModel.formSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON record to the model
      return CategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        parentId: data['ParentId'] ?? '',
        isFetured: data['IsFeatured'] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
