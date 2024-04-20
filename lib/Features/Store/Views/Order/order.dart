import 'package:flutter/material.dart';

import '../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../Util/Constant/sizes.dart';
import 'Widget/orders_list.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViAppBar(
        title:
            Text('My Orders', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(ViSizes.defaultSpace),
        child: ViOrderListItems(),
      ),
    );
  }
}
