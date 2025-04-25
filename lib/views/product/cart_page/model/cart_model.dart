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
