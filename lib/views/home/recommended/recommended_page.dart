import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/views/widgets/build_grid_product_card.dart';

class RecommendedPage extends StatelessWidget {
  const RecommendedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: buildText(
            context,
            text: 'Recommended For You',
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
            children: [BuildGridProductCard()],
          ),
        )));
  }

  // Widget _BuildGridProductCard()(String iName) {
  //   return SizedBox(
  //     child: GridView.builder(
  //       itemCount: 10,
  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2,
  //         mainAxisExtent: 304,
  //         crossAxisSpacing: 10.0,
  //         mainAxisSpacing: 10.0,
  //       ),
  //       shrinkWrap: true,
  //       scrollDirection: Axis.vertical,
  //       physics: NeverScrollableScrollPhysics(),
  //       itemBuilder: (context, index) {
  //         return Container(
  //           width: getScreenSize(context).width * 0.5,
  //           decoration: BoxDecoration(
  //             color: const Color.fromARGB(255, 188, 221, 248),
  //             borderRadius: BorderRadius.circular(10.0),
  //           ),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Stack(
  //                 children: [
  //                   ClipRRect(
  //                     borderRadius: BorderRadius.circular(10.0),
  //                     child: PrimaryImage(
  //                       path: [iName],
  //                       height: getScreenSize(context).height * 0.185,
  //                       width: getScreenSize(context).width * 0.5,
  //                       fit: BoxFit.fill,
  //                     ),
  //                   ),
  //                   Positioned(
  //                     right: 0,
  //                     child: IconButton(
  //                       onPressed: () {},
  //                       icon: Icon(
  //                         Icons.favorite,
  //                         size: 30,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               PrimaryPadding(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     buildText(context,
  //                         text: 'Wooden White Sofa',
  //                         themeSelect: (t) => t.bodyMedium!),
  //                     buildText(context,
  //                         text: 'Chair', themeSelect: (t) => t.bodySmall!),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         buildText(context,
  //                             text: '\$ 300', themeSelect: (t) => t.bodySmall!),
  //                         IconButton(
  //                           onPressed: () {},
  //                           icon: Icon(Icons.shopping_basket),
  //                         ),
  //                       ],
  //                     )
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}
