import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/views/product/model/product_model.dart';
import 'package:furniture_yt/views/saved/model/saved_product_model.dart';
import 'package:furniture_yt/views/widgets/build_grid_product_card.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  final controller = PrimaryTexteditingController();

  List<ProductModel> _filterProduct = savedProduct;

// search product
  _searchProduct() {
    String query = controller.searchController.text.trim().toLowerCase();
    setState(() {
      _filterProduct = savedProduct
          .where((t) => t.title.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void initState() {
    controller.searchController.addListener(_searchProduct);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    controller.searchController.removeListener(_searchProduct);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: buildText(
            context,
            text: 'Saved Screen',
            themeSelect: (t) => t.titleMedium!,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteName.rCart);
              },
              icon: Icon(Icons.shopping_basket),
            ),
          ],
        ),
        body: PrimaryPadding(
          child: SingleChildScrollView(
            child: Column(
              spacing: 10.0,
              children: [
                PrimaryTextfield(
                  controller: controller.searchController,
                  labelText: 'Search',
                  keyboardType: TextInputType.text,
                  icon: Icon(Icons.filter_5),
                ),
                savedProduct.isEmpty
                    ? Center(
                        child: Text('No Products Available'),
                      )
                    : BuildGridProductCard(
                        products: _filterProduct,
                      ),
              ],
            ),
          ),
        ));
  }
}
