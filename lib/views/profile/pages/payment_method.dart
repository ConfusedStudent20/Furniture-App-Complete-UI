import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/views/profile/pages/model/payment_method_model.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  final controller = PrimaryTexteditingController();
  final txt = CommonString();
  @override
  dispose() {
    super.dispose();
    controller.dispose();
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildText(
          context,
          text: 'Payment Method',
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
        child: Column(
          spacing: 10.0,
          children: [
            Column(
              spacing: 10.0,
              children: List.generate(
                PaymentModel.paymentModel.length,
                (index) {
                  final data = PaymentModel.paymentModel[index];
                  return ListTile(
                    leading: PrimaryImage(
                      path: [data.path],
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
                    ),
                    title: buildText(
                      context,
                      text: data.text,
                      themeSelect: (t) => t.bodyMedium!,
                    ),
                    trailing: Radio(
                        value: index,
                        groupValue: _currentIndex,
                        onChanged: (value) {
                          setState(() {
                            _currentIndex = value!;
                          });
                        }),
                  );
                },
              ),
            ),
            PrimaryOutlinedButton(
              buttonName: 'Add New Card',
              onPressed: () {
                _buildAddCard(context);
              },
              size: Size(getScreenSize(context).width * 0.5, 50),
            ),
            PrimaryElevatedButton(buttonName: 'Save', onPressed: () {})
          ],
        ),
      ),
    );
  }

  _buildAddCard(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (
          context,
        ) {
          return AlertDialog(
            title: buildText(
              context,
              text: 'Add New Card',
              themeSelect: (t) => t.bodyMedium!,
            ),
            backgroundColor: const Color.fromARGB(255, 252, 237, 237),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
            ),
            content: PrimaryPadding(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10.0,
                  children: [
                    PrimaryTextfield(
                      controller: controller.cardHolderNameController,
                      labelText: txt.sCardHolderName,
                      keyboardType: TextInputType.name,
                    ),
                    PrimaryTextfield(
                      controller: controller.cardNumberController,
                      labelText: txt.sCardNumber,
                      keyboardType: TextInputType.number,
                    ),
                    Row(
                      spacing: 10.0,
                      children: [
                        Expanded(
                          child: PrimaryTextfield(
                            controller: controller.monthController,
                            labelText: txt.sMonth,
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                        Expanded(
                          child: PrimaryTextfield(
                            controller: controller.cvvController,
                            labelText: txt.sCvv,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildText(
                    context,
                    text: 'Cancel',
                    themeSelect: (t) => t.bodySmall!,
                  ),
                  PrimaryElevatedButton(
                      buttonName: 'Save',
                      size: Size(100,50),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              )
            ],
          );
        });
  }
}
