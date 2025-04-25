import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/views/widgets/build_grid_product_card.dart';

class BestSellingPage extends StatelessWidget {
  const BestSellingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: buildText(
            context,
            text: 'Best Selling',
            themeSelect: (t) => t.titleMedium!,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Navigator.of(context).pushReplacementNamed(RouteName.rHome);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: PrimaryPadding(
            child: SingleChildScrollView(
          child: Column(
            children: [BuildGridProductCard()],
          ),
        )));
  }
}
