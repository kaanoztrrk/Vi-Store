import 'package:ecommerce_app/Features/Store/Models/product_model.dart';
import 'package:ecommerce_app/Util/Constant/enums.dart';
import 'package:ecommerce_app/Util/Loader/vi_loader.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Data/Repositories/Product/product_repository.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      // Yüklenirken Loader göster
      isLoading.value = true;

      // Firebase'in hazır olduğundan emin ol
      await Firebase.initializeApp();

      // Ürünleri getir
      final products = await productRepository.getFeaturedProducts();

      // featuredProducts listesini güncelle
      featuredProducts.value = products;
    } on FirebaseException catch (e) {
      // Firebase hata durumunda SnackBar göster
      ViLoaders.errorSnacBar(
        title: 'Firebase Error',
        message: e.message ?? 'An error occurred',
      );
    } on PlatformException catch (e) {
      // Platform hata durumunda SnackBar göster
      ViLoaders.errorSnacBar(
        title: 'Platform Error',
        message: e.message ?? 'An error occurred',
      );
    } catch (e) {
      // Diğer hata durumunda SnackBar göster
      ViLoaders.errorSnacBar(
        title: 'Error',
        message: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Ürün fiyatını veya varyasyon fiyat aralığını al
  String getProductPrice(ProductModel product) {
    if (product.productType == ProductType.single) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      double smallestPrice = double.infinity;
      double largestPrice = 0.0;

      for (var variation in product.productVariations ?? []) {
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      return smallestPrice == largestPrice
          ? largestPrice.toString()
          : '$smallestPrice - \$$largestPrice';
    }
  }

  // İndirim yüzdesini hesapla
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;

    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  // Ürün stok durumunu al
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
