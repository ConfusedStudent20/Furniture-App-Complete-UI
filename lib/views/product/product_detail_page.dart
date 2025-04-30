import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/views/product/model/product_model.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool _isAllowed = false;
  late String _selectImage;
  @override
  void initState() {
    super.initState();
    _selectImage = widget.product.imagePath.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 10.0,
        children: [
          Stack(
            children: [
              PrimaryImage(
                path: [_selectImage],
                height: getScreenSize(context).height * 0.3,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
              Positioned(
                left: 15,
                top: 30,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: getScreenSize(context).width * 0.95,
            height: 120,
            decoration: BoxDecoration(
              color: CommonColor.cContainerColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              spacing: 10.0,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                widget.product.imagePath.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectImage = widget.product.imagePath[index];
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: PrimaryImage(
                      path: [widget.product.imagePath[index]],
                      height: getScreenSize(context).height * 0.3,
                      width: getScreenSize(context).width * 0.3,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
              color: CommonColor.cBottomSheetColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    30.0,
                  ),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: PrimaryPadding(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10.0,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildText(
                            context,
                            text: widget.product.category.name.toUpperCase(),
                            themeSelect: (t) => t.titleMedium!,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: CommonColor.cOrangeColor,
                              ),
                              buildText(
                                context,
                                text: widget.product.rating.toString(),
                                themeSelect: (t) => t.bodySmall!,
                              ),
                            ],
                          )
                        ],
                      ),
                      buildText(
                        context,
                        text: '\$ ${widget.product.price.toString()}',
                        themeSelect: (t) => t.titleMedium!,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildText(
                            context,
                            text: widget.product.title,
                            themeSelect: (t) => t.bodyMedium!,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildText(
                            context,
                            text: 'Product Details',
                            themeSelect: (t) => t.titleMedium!,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _isAllowed = !_isAllowed;
                              });
                            },
                            icon: Icon(Icons.arrow_downward),
                          ),
                        ],
                      ),
                      buildText(
                        context,
                        lines: _isAllowed ? 100 : 2,
                        text: widget.product.description ?? '',
                        themeSelect: (t) => t.bodySmall!,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: CommonColor.cBottomSheetColor,
        child: PrimaryPadding(
          child: PrimaryElevatedButton(
            buttonName: 'Add to Cart',
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

// Riverpod Implementation

// import 'package:furniture_yt/cores/consts/const.dart';
// import 'package:furniture_yt/views/product/model/product_model.dart';

// class ProductDetailPage extends ConsumerStatefulWidget {
//   final ProductModel product;

//   const ProductDetailPage({
//     super.key,
//     required this.product,
//   });

//   @override
//   ConsumerState<ProductDetailPage> createState() => _ProductDetailPageState();
// }

// class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration.zero, () {
//       ref.read(selectedImageProvider.notifier).state =
//           widget.product.imagePath.first;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isExpanded = ref.watch(isExpandedProvider);
//     final selectImage = ref.watch(selectedImageProvider);
//     return Scaffold(
//       body: Column(
//         spacing: 10.0,
//         children: [
//           Stack(
//             children: [
//               PrimaryImage(
//                 path: [selectImage],
//                 height: getScreenSize(context).height * 0.3,
//                 fit: BoxFit.fill,
//                 width: double.infinity,
//               ),
//               Positioned(
//                 left: 15,
//                 top: 30,
//                 child: IconButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   icon: Icon(
//                     Icons.arrow_back,
//                     size: 40,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Container(
//             width: getScreenSize(context).width * 0.95,
//             height: 120,
//             decoration: BoxDecoration(
//               color: Theme.of(context).cardColor,
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: Row(
//               spacing: 10.0,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: List.generate(
//                 widget.product.imagePath.length,
//                 (index) => GestureDetector(
//                   onTap: () {
//                     ref.read(selectedImageProvider.notifier).state =
//                         widget.product.imagePath[index];
//                   },
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10.0),
//                     child: PrimaryImage(
//                       path: [widget.product.imagePath[index]],
//                       height: getScreenSize(context).height * 0.3,
//                       width: getScreenSize(context).width * 0.3,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Theme.of(context).cardColor,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(
//                     30.0,
//                   ),
//                   topRight: Radius.circular(30.0),
//                 ),
//               ),
//               child: PrimaryPadding(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     spacing: 10.0,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           buildText(
//                             context,
//                             text: widget.product.category.name.toUpperCase(),
//                             themeSelect: (t) => t.titleMedium!,
//                           ),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.star,
//                                 color: CommonColor.cOrangeColor,
//                               ),
//                               buildText(
//                                 context,
//                                 text: widget.product.rating.toString(),
//                                 themeSelect: (t) => t.bodySmall!,
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                       buildText(
//                         context,
//                         text: '\$ ${widget.product.price.toString()}',
//                         themeSelect: (t) => t.titleMedium!,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           buildText(
//                             context,
//                             text: widget.product.title,
//                             themeSelect: (t) => t.bodyMedium!,
//                           ),
//                           IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.favorite),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           buildText(
//                             context,
//                             text: 'Product Details',
//                             themeSelect: (t) => t.titleMedium!,
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               ref.read(isExpandedProvider.notifier).state =
//                                   !isExpanded;
//                             },
//                             icon: Icon(Icons.arrow_downward),
//                           ),
//                         ],
//                       ),
//                       buildText(
//                         context,
//                         lines: isExpanded ? 100 : 2,
//                         text: widget.product.description ?? '',
//                         themeSelect: (t) => t.bodySmall!,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//       bottomNavigationBar: Container(
//         color: Theme.of(context).cardColor,
//         child: PrimaryPadding(
//           child: PrimaryElevatedButton(
//             buttonName: 'Add to Cart',
//             onPressed: () {},
//           ),
//         ),
//       ),
//     );
//   }
// }
