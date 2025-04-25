import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/views/product/model/product_model.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildText(
          context,
          text: 'Categories',
          themeSelect: (t) => t.titleMedium!,
        ),
      ),
      body: PrimaryPadding(
          child: ListView.separated(
        shrinkWrap: true,
        itemCount: ProductCategory.values.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final data = ProductCategory.values[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(RouteName.rCategoriesProduct,arguments: data);
            },
            child: Container(
              width: getScreenSize(context).width * 0.95,
              decoration: BoxDecoration(
                color: CommonColor.cContainerColor,
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Expanded(child:  buildText(
                  //   context,
                  //   text: 'Sofa',
                  //   themeSelect: (t) => t.bodyMedium!,
                  // ),)
                  buildText(
                    context,
                    text: data.name.toUpperCase(),
                    themeSelect: (t) => t.bodyMedium!,
                  ),
                  PrimaryImage(
                    path: [data.imagePath],
                    height: getScreenSize(context).height * 0.25,
                    width: getScreenSize(context).width * 0.4,
                    fit: BoxFit.fill,
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 10.0,
        ),
      )),
    );
  }
}
