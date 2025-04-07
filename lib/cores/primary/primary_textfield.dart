import 'package:furniture_yt/cores/consts/const.dart';

class PrimaryTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final Icon? icon;
  final TextInputType? keyboardType;

  const PrimaryTextfield({
    super.key,
    required this.controller,
    this.labelText,
    this.icon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.bodySmall,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: icon,
      ),
    );
  }
}
