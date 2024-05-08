import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Common/Widget/shimmer/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../Common/Widget/Products/sortable/sortable_products.dart';
import '../../../../Util/Constant/sizes.dart';
import '../../Controllers/Product/all_products_controller.dart';
import '../../Models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());

    return Scaffold(
      appBar: ViAppBar(
        title: Text(title, style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(ViSizes.defaultSpace),
            child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductByQuery(query),
              builder: (context, snapshot) {
                const loader = ViVerticalProdductShimmer();
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return loader;
                }
                if (!snapshot.hasData ||
                    snapshot.data == null ||
                    snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('No Data Found!'),
                  );
                }

                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }

                // Product found !
                final products = snapshot.data!;
                return ViSortableProducts(products: products);
              },
            )),
      ),
    );
  }
}
