import 'package:ecommerce_app/Data/Model/Banner/banner_model.dart';
import 'package:ecommerce_app/Data/Repositories/Banners/banner_repository.dart';
import 'package:get/get.dart';

import '../../../Util/Loader/vi_loader.dart';

class BannerController extends GetxController {
  // Variables
  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  // Update page navigational dots
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  // Fetch Banner
  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;

      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      this.banners.assignAll(banners);
    } catch (e) {
      ViLoaders.errorSnacBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }
}
