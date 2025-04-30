import 'package:furniture_yt/views/product/model/product_model.dart';

List<ProductModel> cartProduct = [];
Map<int, int> cartQuantities = {};

bool isCartAdded(ProductModel product) {
  return cartProduct.any((t) => t.id == product.id);
}

void toggleCartProduct(ProductModel product) {
  if (isCartAdded(product)) {
    cartProduct.removeWhere((i) => i.id == product.id);
  } else {
    product.quantity ??= 1;
    cartProduct.add(product);
  }
}




// RiverPod Implementation
// import 'package:furniture_yt/cores/consts/const.dart';
// import 'package:furniture_yt/provider/cart_product_provider.dart';
// import 'package:furniture_yt/views/product/model/product_model.dart';

// bool isCartAdded(WidgetRef ref, ProductModel product) {
//   final cartProduct = ref.watch(cartProductProvider);
//   return cartProduct.any((t) => t.id == product.id);
// }

// void toggleCartProduct(WidgetRef ref, ProductModel product) {
//   final ctProduct = ref.read(cartProductProvider.notifier);
//   final currentData = ctProduct.state;
//   if (currentData.any((t) => t.id == product.id)) {
//     ctProduct.state = currentData.where((i) => i.id != product.id).toList();
//   } else {
//     ctProduct.state = [...currentData, product];
//   }
// }
