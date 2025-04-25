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
