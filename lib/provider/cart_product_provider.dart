import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/views/product/model/product_model.dart';

// cart product provider
final cartProductProvider =
    StateNotifierProvider<CartNotifier, List<ProductModel>>((ref) {
  return CartNotifier();
});

// cart quantity provider
final cartQuantityProvider =
    StateNotifierProvider<CartQuantityNotifier, Map<int, int>>((ref) {
  return CartQuantityNotifier();
});

// cart notifier
class CartNotifier extends StateNotifier<List<ProductModel>> {
  CartNotifier() : super([]);

// add Product
  void addCart(ProductModel data) {
    state = [...state, data];
  }

// remove product
  void removeCart(ProductModel data) {
    state = state.where((p) => p != data).toList();
  }

// clear product
  void clearCart() {
    state = [];
  }
}

// cart quantity notifier
class CartQuantityNotifier extends StateNotifier<Map<int, int>> {
  CartQuantityNotifier() : super({});

// add cart quantity
  void increaseCartQuantity(int index) {
    if (state.containsKey(index)) {
      state = {
        ...state,
        index: state[index]! + 1,
      };
    }
  }

// decrease cart quantity

  void decreaseCartQuantity(int index) {
    if (state.containsKey(index) && state[index]! > 1) {
      state = {
        ...state,
        index: state[index]! - 1,
      };
    }
  }

  // remove cart quantity
  void removeCartQuantity(ProductModel data) {
    state = {};
  }
}
