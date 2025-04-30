import 'package:furniture_yt/views/product/cart_page/model/cart_model.dart';

int deliveryCharge = 30;
double buildSubTotal() {
  double subTotal = 0.0;
  for (int i = 0; i < cartProduct.length; i++) {
    final pr = cartProduct[i];
    subTotal = subTotal + (pr.price * (cartQuantities[i] ?? 1));
  }
  return subTotal;
}

double buildTotal() {
  return buildSubTotal() + deliveryCharge;
}

// Riverpod Implementation
// import 'package:furniture_yt/cores/consts/const.dart';
// import 'package:furniture_yt/provider/cart_product_provider.dart';

// int deliveryCharge = 30;
// double buildSubTotal(WidgetRef ref) {
//   final cartProduct = ref.watch(cartProductProvider);
//   final cartQuantities = ref.watch(cartQuantityProvider);

//   double subTotal = 0.0;
//   for (int i = 0; i < cartProduct.length; i++) {
//     final pr = cartProduct[i];
//     subTotal = subTotal + (pr.price * (cartQuantities[i] ?? 1));
//   }
//   return subTotal;
// }

// double buildTotal(WidgetRef ref) {
//   return buildSubTotal(ref) + deliveryCharge;
// }
