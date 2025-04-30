import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/views/product/model/product_model.dart';
import 'package:furniture_yt/views/saved/model/saved_product_model.dart';

class BuildGridProductCard extends StatefulWidget {
  final List<ProductModel>? products;
  const BuildGridProductCard({super.key, this.products});

  @override
  State<BuildGridProductCard> createState() => _BuildGridProductCardState();
}

class _BuildGridProductCardState extends State<BuildGridProductCard> {
  @override
  Widget build(BuildContext context) {
    final pList = widget.products ?? ProductLists.productListsModel;

    return SizedBox(
      child: GridView.builder(
        itemCount: pList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 276,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final data = pList[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(RouteName.rProductDetail,
              arguments: data,
              );
            },
            child: Container(
              width: getScreenSize(context).width * 0.5,
              decoration: BoxDecoration(
                color: CommonColor.cContainerColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: PrimaryImage(
                          path: data.imagePath,
                          height: getScreenSize(context).height * 0.185,
                          width: getScreenSize(context).width * 0.5,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              toggleProductSaved(data);
                            });
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: isProductsSaved(data)
                                ? CommonColor.cRedColor
                                : null,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  PrimaryPadding(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildText(context,
                            text: data.title,
                            themeSelect: (t) => t.bodyMedium!),
                        buildText(context,
                            text: data.category.name[0].toUpperCase() +
                                data.category.name.substring(1),
                            themeSelect: (t) => t.bodySmall!),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildText(context,
                                text: '\$ ${data.price.toString()}',
                                themeSelect: (t) => t.bodySmall!),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.shopping_basket),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
   // Riverpod Implementation

// import 'package:furniture_yt/cores/consts/const.dart';
// import 'package:furniture_yt/views/product/model/product_model.dart';
// import 'package:furniture_yt/views/saved/model/saved_product_model.dart';

// class BuildGridProductCard extends ConsumerStatefulWidget {
//   final List<ProductModel>? products;
//   const BuildGridProductCard({super.key, this.products});

//   @override
//   ConsumerState<BuildGridProductCard> createState() =>
//       _BuildGridProductCardState();
// }

// class _BuildGridProductCardState extends ConsumerState<BuildGridProductCard> {
//   @override
//   Widget build(BuildContext context) {
//     final pList = widget.products ?? ProductLists.productListsModel;

//     return SizedBox(
//       child: GridView.builder(
//         itemCount: pList.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisExtent: 276,
//           crossAxisSpacing: 10.0,
//           mainAxisSpacing: 10.0,
//         ),
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         physics: NeverScrollableScrollPhysics(),
//         itemBuilder: (context, index) {
//           final data = pList[index];
//           return InkWell(
//             onTap: () {
//               Navigator.of(context).pushNamed(
//                 RouteName.rProductDetail,
//                 arguments: data,
//               );
//             },
//             child: Container(
//               width: getScreenSize(context).width * 0.5,
//               decoration: BoxDecoration(
//                 color: CommonColor.cContainerColor,
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Stack(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(10.0),
//                         child: PrimaryImage(
//                           path: data.imagePath,
//                           height: getScreenSize(context).height * 0.185,
//                           width: getScreenSize(context).width * 0.5,
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                       Positioned(
//                         right: 0,
//                         child: IconButton(
//                           onPressed: () {
//                             toggleProductSaved(ref, data);
//                           },
//                           icon: Icon(
//                             Icons.favorite,
//                             color: isProductsSaved(ref, data)
//                                 ? CommonColor.cRedColor
//                                 : null,
//                             size: 30,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   PrimaryPadding(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         buildText(context,
//                             text: data.title,
//                             themeSelect: (t) => t.bodyMedium!),
//                         buildText(context,
//                             text: data.category.name[0].toUpperCase() +
//                                 data.category.name.substring(1),
//                             themeSelect: (t) => t.bodySmall!),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             buildText(context,
//                                 text: '\$ ${data.price.toString()}',
//                                 themeSelect: (t) => t.bodySmall!),
//                             IconButton(
//                               onPressed: () {},
//                               icon: Icon(Icons.shopping_basket),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
