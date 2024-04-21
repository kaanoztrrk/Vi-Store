import 'package:ecommerce_app/Data/Repositories/Categories/category_repository.dart';
import 'package:ecommerce_app/Features/Store/Models/category_model.dart';
import 'package:ecommerce_app/Util/Loader/vi_loader.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> fetaturedCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// - Load category data

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      final categories = await _categoryRepository.getAllCategories();

      allCategories.assignAll(categories);

      fetaturedCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      ViLoaders.errorSnacBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }

  /// - Load selected category data

  /// - Get Category or Su-Category Product
}
