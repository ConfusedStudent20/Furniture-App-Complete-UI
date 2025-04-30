import 'package:furniture_yt/views/product/model/product_model.dart';

List<ProductModel> savedProduct = [];

bool isProductsSaved(ProductModel product) {
  return savedProduct.any((t) => t.id == product.id);
}

void toggleProductSaved(ProductModel product) {
  if (isProductsSaved(product)) {
    savedProduct.removeWhere((i) => i.id == product.id);
  } else {
    savedProduct.add(product);
  }
}

// Riverpod Implementation
// import 'package:furniture_yt/cores/consts/const.dart';
// import 'package:furniture_yt/provider/saved_product_provider.dart';
// import 'package:furniture_yt/views/product/model/product_model.dart';

// bool isProductsSaved(WidgetRef ref, ProductModel product) {
//   final savedProduct = ref.watch(savedProductProvider);

//   return savedProduct.any((t) => t.id == product.id);
// }

// void toggleProductSaved(WidgetRef ref, ProductModel product) {
//   final savedProduct = ref.read(savedProductProvider.notifier);
//   final currentData = savedProduct.state;
//   if (currentData.any((t) => t.id == product.id)) {
//     savedProduct.state = currentData.where((i) => i.id != product.id).toList();
//   } else {
//     savedProduct.state = [...currentData, product];
//   }
// }
