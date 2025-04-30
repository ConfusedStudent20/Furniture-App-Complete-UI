import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/views/product/cart_page/model/cart_model.dart';
import 'package:furniture_yt/views/product/widgets/build_price_calculate.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _isAllowed = false;
  int deliveryCharge = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: buildText(
            context,
            text: 'Cart Page',
            themeSelect: (t) => t.titleMedium!,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: cartProduct.isEmpty
            ? Center(
                child: Text('Cart is Empty'),
              )
            : PrimaryPadding(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 10.0,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildText(
                            context,
                            text: 'Items',
                            themeSelect: (t) => t.bodyMedium!,
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  _isAllowed = !_isAllowed;
                                });
                              },
                              icon: Icon(Icons.arrow_downward)),
                        ],
                      ),
                      ListView.separated(
                        itemCount: _isAllowed ? cartProduct.length : 1,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final data = cartProduct[index];
                          cartQuantities.putIfAbsent((index), () => 1);
                          return Container(
                            width: getScreenSize(context).width * 0.95,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 226, 228, 226),
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            child: Row(
                              spacing: 15.0,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                  child: PrimaryImage(
                                    path: data.imagePath,
                                    height:
                                        getScreenSize(context).height * 0.25,
                                    width: getScreenSize(context).width * 0.4,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    buildText(context,
                                        text: data.title,
                                        themeSelect: (t) => t.bodyMedium!),
                                    buildText(context,
                                        text: data.category.name.toUpperCase(),
                                        themeSelect: (t) => t.bodySmall!),
                                    buildText(context,
                                        text: '\$ ${data.price.toString()}',
                                        themeSelect: (t) => t.bodySmall!),
                                    buildText(context,
                                        text:
                                            'Stock :${data.quantity.toString()}',
                                        themeSelect: (t) => t.bodySmall!),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              color: Colors.lightGreen,
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  if (cartQuantities[index]! >
                                                      1) {
                                                    setState(() {
                                                      cartQuantities[index] =
                                                          cartQuantities[
                                                                  index]! -
                                                              1;
                                                    });
                                                  }
                                                },
                                                icon: Icon(Icons.remove),
                                              ),
                                              buildText(
                                                context,
                                                text: cartQuantities[index]!
                                                    .toString(),
                                                themeSelect: (t) =>
                                                    t.bodySmall!,
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  if (cartQuantities[index]! <
                                                      data.quantity!) {
                                                    setState(() {
                                                      cartQuantities[index] =
                                                          cartQuantities[
                                                                  index]! +
                                                              1;
                                                    });
                                                  }
                                                },
                                                icon: Icon(Icons.add),
                                              )
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              cartProduct.remove(data);
                                              cartQuantities.remove(index);
                                            });
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: CommonColor.cRedColor,
                                            size: 40,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (_, index) => SizedBox(
                          height: 10.0,
                        ),
                      ),
                      Divider(
                        color: CommonColor.cBlackColor,
                        height: 1.0,
                      ),
                      _buildPriceText(
                          context: context,
                          text1: 'Sub Total',
                          text2: '\$ ${buildSubTotal().toStringAsFixed(2)}'),
                      _buildPriceText(
                          context: context,
                          text1: 'Delivery Charge',
                          text2: '\$ $deliveryCharge'),
                      _buildPriceText(
                          context: context,
                          text1: 'Total',
                          text2: '\$ ${buildTotal().toStringAsFixed(2)}'),
                      SizedBox(
                        height: 40,
                      ),
                      PrimaryElevatedButton(
                        buttonName: 'Checkout',
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RouteName.rCheckout, arguments: {
                            'cartItems': cartProduct,
                            'cartQuantity': cartQuantities,
                            'totalItems': cartQuantities.values
                                .fold(0, (sum, quantity) => sum + quantity),
                            'subTotal': buildSubTotal(),
                            'deliveryCharge': deliveryCharge,
                            'total': buildTotal(),
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ));
  }

// build price text
  Widget _buildPriceText({
    required BuildContext context,
    required String text1,
    required String text2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildText(context, text: text1, themeSelect: (t) => t.bodyMedium!),
        buildText(context, text: text2, themeSelect: (t) => t.bodySmall!),
      ],
    );
  }
}



// Riverpod Implementation
// import 'package:furniture_yt/cores/consts/const.dart';
// import 'package:furniture_yt/provider/cart_product_provider.dart';
// import 'package:furniture_yt/views/product/widgets/build_price_calculate.dart';

// class CartPage extends ConsumerStatefulWidget {
//   const CartPage({super.key});

//   @override
//   ConsumerState<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends ConsumerState<CartPage> {
//   int deliveryCharge = 30;

//   @override
//   Widget build(BuildContext context) {
//     final isExpanded = ref.watch(isExpandedProvider);
//     final cartProduct = ref.watch(cartProductProvider);
//     final cartQuantities = ref.watch(cartQuantityProvider);
//     final cartQuantitiesNotifier = ref.read(cartQuantityProvider.notifier);
//     final cartProductNotifier = ref.read(cartProductProvider.notifier);

//     return Scaffold(
//         appBar: AppBar(
//           title: buildText(
//             context,
//             text: 'Cart Page',
//             themeSelect: (t) => t.titleMedium!,
//           ),
//           leading: IconButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             icon: Icon(Icons.arrow_back),
//           ),
//         ),
//         body: cartProduct.isEmpty
//             ? Center(
//                 child: Text('Cart is Empty'),
//               )
//             : PrimaryPadding(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     spacing: 10.0,
//                     // crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           buildText(
//                             context,
//                             text: 'Items',
//                             themeSelect: (t) => t.bodyMedium!,
//                           ),
//                           IconButton(
//                               onPressed: () {
//                                 ref.read(isExpandedProvider.notifier).state =
//                                     !isExpanded;
//                               },
//                               icon: Icon(Icons.arrow_downward)),
//                         ],
//                       ),
//                       ListView.separated(
//                         itemCount: isExpanded ? cartProduct.length : 1,
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemBuilder: (context, index) {
//                           final data = cartProduct[index];
//                           cartQuantities.putIfAbsent((index), () => 1);
//                           return Container(
//                             width: getScreenSize(context).width * 0.95,
//                             decoration: BoxDecoration(
//                               color: const Color.fromARGB(255, 226, 228, 226),
//                               borderRadius: BorderRadius.circular(
//                                 10.0,
//                               ),
//                             ),
//                             child: Row(
//                               spacing: 15.0,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.circular(
//                                     10.0,
//                                   ),
//                                   child: PrimaryImage(
//                                     path: data.imagePath,
//                                     height:
//                                         getScreenSize(context).height * 0.25,
//                                     width: getScreenSize(context).width * 0.4,
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     buildText(context,
//                                         text: data.title,
//                                         themeSelect: (t) => t.bodyMedium!),
//                                     buildText(context,
//                                         text: data.category.name.toUpperCase(),
//                                         themeSelect: (t) => t.bodySmall!),
//                                     buildText(context,
//                                         text: '\$ ${data.price.toString()}',
//                                         themeSelect: (t) => t.bodySmall!),
//                                     buildText(context,
//                                         text:
//                                             'Stock :${data.quantity.toString()}',
//                                         themeSelect: (t) => t.bodySmall!),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                           height: 50,
//                                           width: 120,
//                                           decoration: BoxDecoration(
//                                               color: Colors.lightGreen,
//                                               borderRadius:
//                                                   BorderRadius.circular(10.0)),
//                                           child: Row(
//                                             children: [
//                                               IconButton(
//                                                 onPressed: () {
//                                                   if (cartQuantities[index]! >
//                                                       1) {
//                                                     cartQuantitiesNotifier
//                                                         .decreaseCartQuantity(
//                                                             index);
//                                                   }
//                                                 },
//                                                 icon: Icon(Icons.remove),
//                                               ),
//                                               buildText(
//                                                 context,
//                                                 text: cartQuantities[index]!
//                                                     .toString(),
//                                                 themeSelect: (t) =>
//                                                     t.bodySmall!,
//                                               ),
//                                               IconButton(
//                                                 onPressed: () {
//                                                   if (cartQuantities[index]! <
//                                                       data.quantity!) {
//                                                     cartQuantitiesNotifier
//                                                         .increaseCartQuantity(
//                                                             index);
//                                                   }
//                                                 },
//                                                 icon: Icon(Icons.add),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                         IconButton(
//                                           onPressed: () {
//                                             cartProductNotifier
//                                                 .removeCart(data);
//                                             cartQuantitiesNotifier
//                                                 .removeCartQuantity(data);
//                                           },
//                                           icon: Icon(
//                                             Icons.delete,
//                                             color: CommonColor.cRedColor,
//                                             size: 40,
//                                           ),
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                         separatorBuilder: (_, index) => SizedBox(
//                           height: 10.0,
//                         ),
//                       ),
//                       Divider(
//                         color: CommonColor.cBlackColor,
//                         height: 1.0,
//                       ),
//                       _buildPriceText(
//                           context: context,
//                           text1: 'Sub Total',
//                           text2: '\$ ${buildSubTotal(ref).toStringAsFixed(2)}'),
//                       _buildPriceText(
//                           context: context,
//                           text1: 'Delivery Charge',
//                           text2: '\$ $deliveryCharge'),
//                       _buildPriceText(
//                           context: context,
//                           text1: 'Total',
//                           text2: '\$ ${buildTotal(ref).toStringAsFixed(2)}'),
//                       SizedBox(
//                         height: 40,
//                       ),
//                       PrimaryElevatedButton(
//                         buttonName: 'Checkout',
//                         onPressed: () {
//                           Navigator.of(context)
//                               .pushNamed(RouteName.rCheckout, arguments: {
//                             'cartItems': cartProduct,
//                             'cartQuantity': cartQuantities,
//                             'totalItems': cartQuantities.values
//                                 .fold(0, (sum, quantity) => sum + quantity),
//                             'subTotal': buildSubTotal(ref),
//                             'deliveryCharge': deliveryCharge,
//                             'total': buildTotal(ref),
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ));
//   }

// // build price text
//   Widget _buildPriceText({
//     required BuildContext context,
//     required String text1,
//     required String text2,
//   }) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         buildText(context, text: text1, themeSelect: (t) => t.bodyMedium!),
//         buildText(context, text: text2, themeSelect: (t) => t.bodySmall!),
//       ],
//     );
//   }
// }
