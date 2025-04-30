import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/views/product/model/product_model.dart';
import 'package:furniture_yt/views/product/track_order/model/order_status_model.dart';
import 'package:furniture_yt/views/product/track_order/model/steps_model.dart';

class TrackOrderPage extends StatefulWidget {
  final List<ProductModel> cartItems;
  final Map<int, int> cartQuantity;
  final double subTotal;
  final int deliveryCharge;

  const TrackOrderPage({
    super.key,
    required this.cartItems,
    required this.cartQuantity,
    required this.subTotal,
    required this.deliveryCharge,
  });

  @override
  State<TrackOrderPage> createState() => _TrackOrderPageState();
}

class _TrackOrderPageState extends State<TrackOrderPage> {
  final int _currentIndex = 1;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildText(
          context,
          text: 'Track Order',
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
            spacing: 10.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildText(
                    context,
                    text: 'Products',
                    themeSelect: (t) => t.bodyMedium!,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    icon: Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
              ListView.separated(
                itemCount: _isExpanded ? widget.cartItems.length : 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final data = widget.cartItems[index];
                  // widget.cart.putIfAbsent((index), () => 1);
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
                            height: getScreenSize(context).height * 0.25,
                            width: getScreenSize(context).width * 0.4,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Column(
                          spacing: 10.0,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildText(context,
                                text: data.title,
                                themeSelect: (t) => t.bodyMedium!),
                            buildText(context,
                                text: data.category.name.toUpperCase(),
                                themeSelect: (t) => t.bodySmall!),
                            buildText(
                              context,
                              text:
                                  'Qty:${widget.cartQuantity[index]!.toString()}',
                              themeSelect: (t) => t.bodySmall!,
                            ),
                            buildText(context,
                                text: '\$ ${data.price.toString()}',
                                themeSelect: (t) => t.bodySmall!),

                            buildText(context,
                                text:
                                    'Total:\$ ${(widget.cartQuantity[index]! * data.price).toString()}',
                                themeSelect: (t) => t.bodySmall!),

                            // buildText(context,
                            //     text: 'Stock :${data.quantity.toString()}',
                            //     themeSelect: (t) => t.bodySmall!),
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
              buildText(
                context,
                text: 'Order Details',
                themeSelect: (t) => t.bodyMedium!,
              ),
              _buildTrackDetails(
                  context: context,
                  text1: 'Expected Delivery Date',
                  text2: '03 Sep 2025'),
              _buildTrackDetails(
                  context: context, text1: 'Tracking ID', text2: 'TRCK3913'),
              buildText(
                context,
                text: 'Order Status',
                themeSelect: (t) => t.bodyMedium!,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: OrderStatusModel.orderStatusModel.length,
                  itemBuilder: (context, index) {
                    final data = OrderStatusModel.orderStatusModel[index];

                    bool isCompleted = index <= _currentIndex;
                    bool isCurrent = index == _currentIndex;

                    final step = StepsModel(
                      title: data.title,
                      date: data.dateTime.toString(),
                      icon: data.icon,
                      isCompleted: isCompleted,
                      isCurrent: isCurrent,
                      isLast:
                          index == OrderStatusModel.orderStatusModel.length - 1,
                    );
                    return _buildSteps(step);
                  })
            ],
          ),
        ),
      ),
    );
  }

// steps model

  Widget _buildSteps(StepsModel step) {
    return Row(
      spacing: 10.0,
      children: [
        Column(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: step.isCompleted
                    ? CommonColor.cGreenColor
                    : CommonColor.cGreyColor,
                shape: BoxShape.circle,
              ),
              child: Icon(step.icon, color: CommonColor.cBlackColor),
            ),
            if (!step.isLast)
              Container(
                height: 40,
                width: 2,
                color: step.isCompleted
                    ? CommonColor.cGreenColor
                    : CommonColor.cGreyColor,
              ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildText(
              context,
              text: step.title,
              themeSelect: (t) => t.bodyMedium!.copyWith(
                color: step.isCompleted
                    ? CommonColor.cBlueColor
                    : CommonColor.cBlackColor,
              ),
            ),
            buildText(
              context,
              text: step.date,
              themeSelect: (t) => t.bodyMedium!,
            ),
          ],
        )
      ],
    );
  }

  Widget _buildTrackDetails({
    required BuildContext context,
    required String text1,
    required String text2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildText(context, text: text1, themeSelect: (t) => t.bodySmall!),
        buildText(context, text: text2, themeSelect: (t) => t.bodySmall!),
      ],
    );
  }
}

// Riverpod Implementation
// import 'package:furniture_yt/cores/consts/const.dart';
// import 'package:furniture_yt/views/product/model/product_model.dart';
// import 'package:furniture_yt/views/product/track_order/model/order_status_model.dart';
// import 'package:furniture_yt/views/product/track_order/model/steps_model.dart';

// class TrackOrderPage extends ConsumerStatefulWidget {
//   final List<ProductModel> cartItems;
//   final Map<int, int> cartQuantity;
//   final double subTotal;
//   final int deliveryCharge;

//   const TrackOrderPage({
//     super.key,
//     required this.cartItems,
//     required this.cartQuantity,
//     required this.subTotal,
//     required this.deliveryCharge,
//   });

//   @override
//   ConsumerState<TrackOrderPage> createState() => _TrackOrderPageState();
// }

// class _TrackOrderPageState extends ConsumerState<TrackOrderPage> {
//   final int _currentIndex = 1;

//   @override
//   Widget build(BuildContext context) {
//     final isExpanded = ref.watch(isExpandedProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: buildText(
//           context,
//           text: 'Track Order',
//           themeSelect: (t) => t.titleMedium!,
//         ),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: Icon(Icons.arrow_back),
//         ),
//       ),
//       body: PrimaryPadding(
//         child: SingleChildScrollView(
//           child: Column(
//             spacing: 10.0,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   buildText(
//                     context,
//                     text: 'Products',
//                     themeSelect: (t) => t.bodyMedium!,
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       ref.read(isExpandedProvider.notifier).state = !isExpanded;
//                     },
//                     icon: Icon(Icons.arrow_drop_down),
//                   ),
//                 ],
//               ),
//               ListView.separated(
//                 itemCount: isExpanded ? widget.cartItems.length : 1,
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   final data = widget.cartItems[index];
//                   // widget.cart.putIfAbsent((index), () => 1);
//                   return Container(
//                     width: getScreenSize(context).width * 0.95,
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 226, 228, 226),
//                       borderRadius: BorderRadius.circular(
//                         10.0,
//                       ),
//                     ),
//                     child: Row(
//                       spacing: 15.0,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(
//                             10.0,
//                           ),
//                           child: PrimaryImage(
//                             path: data.imagePath,
//                             height: getScreenSize(context).height * 0.25,
//                             width: getScreenSize(context).width * 0.4,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         Column(
//                           spacing: 10.0,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             buildText(context,
//                                 text: data.title,
//                                 themeSelect: (t) => t.bodyMedium!),
//                             buildText(context,
//                                 text: data.category.name.toUpperCase(),
//                                 themeSelect: (t) => t.bodySmall!),
//                             buildText(
//                               context,
//                               text:
//                                   'Qty:${widget.cartQuantity[index]!.toString()}',
//                               themeSelect: (t) => t.bodySmall!,
//                             ),
//                             buildText(context,
//                                 text: '\$ ${data.price.toString()}',
//                                 themeSelect: (t) => t.bodySmall!),

//                             buildText(context,
//                                 text:
//                                     'Total:\$ ${(widget.cartQuantity[index]! * data.price).toString()}',
//                                 themeSelect: (t) => t.bodySmall!),

//                             // buildText(context,
//                             //     text: 'Stock :${data.quantity.toString()}',
//                             //     themeSelect: (t) => t.bodySmall!),
//                           ],
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 separatorBuilder: (_, index) => SizedBox(
//                   height: 10.0,
//                 ),
//               ),
//               buildText(
//                 context,
//                 text: 'Order Details',
//                 themeSelect: (t) => t.bodyMedium!,
//               ),
//               _buildTrackDetails(
//                   context: context,
//                   text1: 'Expected Delivery Date',
//                   text2: '03 Sep 2025'),
//               _buildTrackDetails(
//                   context: context, text1: 'Tracking ID', text2: 'TRCK3913'),
//               buildText(
//                 context,
//                 text: 'Order Status',
//                 themeSelect: (t) => t.bodyMedium!,
//               ),
//               ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: OrderStatusModel.orderStatusModel.length,
//                   itemBuilder: (context, index) {
//                     final data = OrderStatusModel.orderStatusModel[index];

//                     bool isCompleted = index <= _currentIndex;
//                     bool isCurrent = index == _currentIndex;

//                     final step = StepsModel(
//                       title: data.title,
//                       date: data.dateTime.toString(),
//                       icon: data.icon,
//                       isCompleted: isCompleted,
//                       isCurrent: isCurrent,
//                       isLast:
//                           index == OrderStatusModel.orderStatusModel.length - 1,
//                     );
//                     return _buildSteps(step);
//                   })
//             ],
//           ),
//         ),
//       ),
//     );
//   }

// // steps model

//   Widget _buildSteps(StepsModel step) {
//     return Row(
//       spacing: 10.0,
//       children: [
//         Column(
//           children: [
//             Container(
//               width: 30,
//               height: 30,
//               decoration: BoxDecoration(
//                 color: step.isCompleted
//                     ? CommonColor.cGreenColor
//                     : CommonColor.cGreyColor,
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(step.icon, color: CommonColor.cBlackColor),
//             ),
//             if (!step.isLast)
//               Container(
//                 height: 40,
//                 width: 2,
//                 color: step.isCompleted
//                     ? CommonColor.cGreenColor
//                     : CommonColor.cGreyColor,
//               ),
//           ],
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             buildText(
//               context,
//               text: step.title,
//               themeSelect: (t) => t.bodyMedium!.copyWith(
//                 color: step.isCompleted
//                     ? CommonColor.cBlueColor
//                     : CommonColor.cBlackColor,
//               ),
//             ),
//             buildText(
//               context,
//               text: step.date,
//               themeSelect: (t) => t.bodyMedium!,
//             ),
//           ],
//         )
//       ],
//     );
//   }

//   Widget _buildTrackDetails({
//     required BuildContext context,
//     required String text1,
//     required String text2,
//   }) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         buildText(context, text: text1, themeSelect: (t) => t.bodySmall!),
//         buildText(context, text: text2, themeSelect: (t) => t.bodySmall!),
//       ],
//     );
//   }
// }
