import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Data/Repositories/Product/product_repository.dart';
import 'package:ecommerce_app/Features/Store/Models/product_model.dart';
import 'package:ecommerce_app/Util/Loader/vi_loader.dart';
import 'package:get/get.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductByQuery(Query? query) async {
    try {
      if (query == null) return [];

      final products = await repository.fetchProductsByQuery(query);

      return products;
    } catch (e) {
      ViLoaders.errorSnacBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  void sortProduct(String sortOption) {
    selectedSortOption.value = sortOption;

    switch (sortOption) {
      case 'Name':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Higher Price':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Lower Price':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Newest':
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      case 'Sale':
        products.sort(
          (a, b) {
            if (b.salePrice > 0) {
              return b.salePrice.compareTo(a.salePrice);
            } else if (a.salePrice > 0) {
              return -1;
            } else {
              return 1;
            }
          },
        );
        break;
      default:
        // default sorting option: Name
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void assingProducts(List<ProductModel> products) {
    // assing products to the 'products' list
    this.products.assignAll(products);
    sortProduct('Name');
  }
}
