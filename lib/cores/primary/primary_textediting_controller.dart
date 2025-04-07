import 'package:furniture_yt/cores/consts/const.dart';

class PrimaryTexteditingController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final pw1Controller = TextEditingController();
  final pw2Controller = TextEditingController();
  final searchController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();

  // card controller
  final cardHolderNameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final monthController = TextEditingController();
  final cvvController = TextEditingController();

  dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    pw1Controller.dispose();
    pw2Controller.dispose();
    searchController.dispose();
    nameController.dispose();
    addressController.dispose();
    cardHolderNameController.dispose();
    cardNumberController.dispose();
    monthController.dispose();
    cvvController.dispose();
  }
}
