import 'package:flutter/material.dart';

import '../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../Common/Widget/Products/sortable/sortable_products.dart';
import '../../../../Util/Constant/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViAppBar(
        title: Text("Popular Products",
            style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ViSizes.defaultSpace),
          child: ViSortableProducts(),
        ),
      ),
    );
  }
}
