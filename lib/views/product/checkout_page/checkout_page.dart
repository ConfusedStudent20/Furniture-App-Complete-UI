import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/views/product/model/product_model.dart';
import 'package:furniture_yt/views/product/widgets/build_price_calculate.dart';

class CheckoutPage extends StatefulWidget {
  final List<ProductModel> cartItems;
  final Map<int, int> cartQuantity;
  final int totalItems;
  final double subTotal;
  final int deliveryCharge;
  final double total;
  const CheckoutPage({
    super.key,
    required this.cartItems,
    required this.totalItems,
    required this.subTotal,
    required this.deliveryCharge,
    required this.total,
    required this.cartQuantity,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final controller = PrimaryTexteditingController();
  @override
  dispose() {
    super.dispose();
    controller.dispose();
  }

  bool _isAllowed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildText(
          context,
          text: 'Checkout',
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
              PrimaryTextfield(
                controller: controller.addressController,
                labelText: 'Address',
                keyboardType: TextInputType.text,
              ),

              buildText(
                context,
                text: 'Payment Method',
                themeSelect: (t) => t.bodyMedium!,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(RouteName.rPayment);
                },
                child: ListTile(
                  leading: PrimaryImage(
                    path: [CommonImage.iMasterCard],
                    width: 50,
                    height: 50,
                    fit: BoxFit.fill,
                  ),
                  title: buildText(
                    context,
                    text: '**** **** **** 4131',
                    themeSelect: (t) => t.bodyMedium!,
                  ),
                  trailing: Icon(Icons.arrow_right),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildText(
                    context,
                    text: 'Order Summary',
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
                itemCount: _isAllowed ? widget.cartItems.length : 1,
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
                            // buildText(context,
                            //     text: 'Stock :${data.quantity.toString()}',
                            //     themeSelect: (t) => t.bodySmall!),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.lightGreen,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Center(
                                    child: buildText(
                                      context,
                                      text: widget.cartQuantity[index]!
                                          .toString(),
                                      themeSelect: (t) => t.bodySmall!,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.cartItems.remove(data);
                                      // cartQuantities.remove(index);
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

              // Container(
              //   width: getScreenSize(context).width * 0.95,
              //   decoration: BoxDecoration(
              //     color: const Color.fromARGB(255, 226, 228, 226),
              //     borderRadius: BorderRadius.circular(
              //       10.0,
              //     ),
              //   ),
              //   child: Row(
              //     spacing: 15.0,
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       ClipRRect(
              //         borderRadius: BorderRadius.circular(
              //           10.0,
              //         ),
              //         child: PrimaryImage(
              //           path: [CommonImage.iPr1],
              //           height: getScreenSize(context).height * 0.25,
              //           width: getScreenSize(context).width * 0.4,
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           buildText(context,
              //               text: 'Wooden White Sofa',
              //               themeSelect: (t) => t.bodyMedium!),
              //           buildText(context,
              //               text: 'Chair', themeSelect: (t) => t.bodySmall!),
              //           buildText(context,
              //               text: '\$ 300', themeSelect: (t) => t.bodySmall!),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Container(
              //                 height: 50,
              //                 width: 50,
              //                 alignment: Alignment.center,
              //                 decoration: BoxDecoration(
              //                     color: Colors.lightGreen,
              //                     borderRadius: BorderRadius.circular(10.0)),
              //                 child: buildText(context,
              //                     text: '4', themeSelect: (t) => t.bodySmall!),
              //               ),
              //               IconButton(
              //                 onPressed: () {},
              //                 icon: Icon(
              //                   Icons.delete,
              //                   color: CommonColor.cRedColor,
              //                   size: 40,
              //                 ),
              //               )
              //             ],
              //           )
              //         ],
              //       ),
              //     ],
              //   ),
              // ),

              _buildPriceText(
                  context: context,
                  text1: 'Total Item',
                  text2: widget.totalItems.toString()),
              _buildPriceText(
                  context: context,
                  text1: 'Sub Total',
                  text2: '\$ ${widget.subTotal.toString()}'),
              _buildPriceText(
                  context: context,
                  text1: 'Delivery Charge',
                  text2: '\$ ${widget.deliveryCharge}'),
              Divider(
                color: CommonColor.cBlackColor,
                height: 1.0,
              ),
              _buildPriceText(
                  context: context,
                  text1: 'Total',
                  text2: '\$ ${widget.total.toString()}'),
              SizedBox(
                height: 40,
              ),
              Center(
                child: PrimaryOutlinedButton(
                  buttonName: 'Checkout',
                  onPressed: () {
                    _buildBottomSheet(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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

// build Bottom Sheet
  Future<dynamic> _buildBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            spacing: 10.0,
            children: [
              PrimaryImage(
                path: [CommonImage.iOrderComplete],
                height: getScreenSize(context).height * 0.35,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              buildText(
                context,
                text: 'Ordered Successfully !!!',
                themeSelect: (t) => t.bodySmall!,
              ),
              PrimaryOutlinedButton(
                  buttonName: 'Track Order',
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(RouteName.rTrackOrder, arguments: {
                      'cartItems': widget.cartItems,
                      'cartQuantity': widget.cartQuantity,
                      'subTotal': buildSubTotal(),
                      'deliveryCharge': widget.deliveryCharge,
                    });
                  }),
            ],
          );
        });
  }
}
