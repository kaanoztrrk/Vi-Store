import 'package:ecommerce_app/Features/Store/Controllers/Product/image_controller.dart';
import 'package:ecommerce_app/Features/Store/Models/product_model.dart';
import 'package:ecommerce_app/Features/Store/Models/product_variation_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  // Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  // Selected AttributeSelected, and variaton
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    // When attribute is selected we will first and that attribute to the selectedAttirbutes
    final selectedAttirbutes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttirbutes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
      (variation) =>
          _isSameAttributeValues(variation.attributeValues, selectedAttirbutes),
      orElse: () => ProductVariationModel.empty(),
    );

    // show the selected variation image as a main image
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value =
          selectedVariation.image;
    }

    // assing selected variaons
    this.selectedVariation.value = selectedVariation;

    // Update selected product variation status
    getProductVariationStockStatus();
  }

  // check if selected attirbutes matches any variation attributes
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    // if selectedAttributes contains 3 attributes and cuttent variations contains 2 then return
    if (variationAttributes.length != selectedAttributes.length) return false;

    // if any of the attributes is different then return . e.g [Green, large] x [Green, small]
    for (var key in variationAttributes.keys) {
      // Attributes[key] = Value which could be [Green, Small, Cotton] etc.
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  // Selected Attributes avaibility / Stock in variation
  Set<String?> getAttributesAvaibilityInVaritaion(
      List<ProductVariationModel> variation, String attributeName) {
    // Pass the variation to check which attributes are available and stock is not 0
    final availableVariationAttributeValues = variation
        .where((variation) =>
            // Check empty/out of stock attributes
            variation.attributeValues[attributeName] != null &&
            variation.attributeValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        // Fetch all non-empty attributes of variation
        .map((e) => e.attributeValues[attributeName])
        .toSet();

    return availableVariationAttributeValues;
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toString();
  }

  // Check product variation stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  // Reset selected attirbutes when switching prodcuts

  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
