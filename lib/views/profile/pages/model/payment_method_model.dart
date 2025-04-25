import 'package:furniture_yt/cores/consts/image.dart';

class PaymentMethodModel {
  final String path;
  final String text;
  PaymentMethodModel({
    required this.path,
    required this.text,
  });
}

class PaymentModel {
  static final List<PaymentMethodModel> paymentModel = [
    PaymentMethodModel(path: CommonImage.iMasterCard, text: 'Cash on Delivery'),
    PaymentMethodModel(
        path: CommonImage.iMasterCard, text: '**** **** **** 3923'),
    PaymentMethodModel(path: CommonImage.iVisa, text: '**** **** **** 3123'),
  ];
}
