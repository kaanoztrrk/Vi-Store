import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/Features/Store/Models/product_model.dart';
import 'package:ecommerce_app/Util/Constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  // Variables
  RxString selectedProductImage = ''.obs;

  // Get all Images from product and Variations
  List<String> getAllProductImages(ProductModel product) {
    // Use Set to add unique images only
    Set<String> images = {};

    // load thumbnail image
    images.add(product.thumbnail);

    // Assing thumbnail as selected ımage
    selectedProductImage.value = product.thumbnail;

    // Get all images from th product model if not null.
    if (product.images != null) {
      images.addAll(product.images!);
    }

    // Get all images from the product variations if not null
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  // Show Images PopUp

  void showEnLargedImage(String image) {
    Get.to(() => Dialog.fullscreen(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: ViSizes.defaultSpace * 2,
                    horizontal: ViSizes.defaultSpace),
                child: CachedNetworkImage(imageUrl: image),
              ),
              const SizedBox(height: ViSizes.spaceBtwSections),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 150,
                  child: OutlinedButton(
                      onPressed: () => Get.back(), child: const Text('Close')),
                ),
              )
            ],
          ),
        ));
  }
}
