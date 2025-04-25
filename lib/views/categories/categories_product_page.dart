import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/views/product/model/product_model.dart';
import 'package:furniture_yt/views/widgets/build_grid_product_card.dart';

class CategoriesProductPage extends StatefulWidget {
  final ProductCategory productCategory;

  const CategoriesProductPage({
    super.key,
    required this.productCategory,
  });

  @override
  State<CategoriesProductPage> createState() => _CategoriesProductPageState();
}

class _CategoriesProductPageState extends State<CategoriesProductPage> {
  @override
  Widget build(BuildContext context) {
    final filterProduct = ProductLists.productListsModel
        .where((p) => p.category == widget.productCategory)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: buildText(
          context,
          text: 'Categories Product Page',
          themeSelect: (t) => t.titleMedium!,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: PrimaryPadding(
        child: SingleChildScrollView(
          child: Column(
            children: [BuildGridProductCard(products: filterProduct)],
          ),
        ),
      ),
    );
  }
}
