import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/views/product/model/product_model.dart';

// saved product provider
final savedProductProvider = StateProvider<List<ProductModel>>((ref) => []);

// search query provider
final searchQueryProvider = StateProvider<String>((ref) => '');

// filtered Product Provider

final filteredProductProvider = StateProvider<List<ProductModel>>((ref) {
  final query = ref.watch(searchQueryProvider).toLowerCase();

  final saveProduct = ref.watch(savedProductProvider);

  return saveProduct
      .where((t) => t.title.toLowerCase().contains(query))
      .toList();
});
