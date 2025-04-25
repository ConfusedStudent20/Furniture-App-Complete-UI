import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/views/auth/verification/widgets/app_bar_style.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final controller = PrimaryTexteditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStyle(
          text: 'Change Password',
          onPressed: () {
            Navigator.of(context).pushNamed(RouteName.rOtpVerification);
          }),
      body: PrimaryPadding(
        child: Column(
          spacing: 20.0,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PrimaryImage(path: [CommonImage.iChangePw]),
            buildText(
              context,
              text: 'Please enter new password',
              themeSelect: (t) => t.bodyMedium!,
            ),
            PrimaryTextfield(
              controller: controller.pw1Controller,
              labelText: 'Password',
            ),
            PrimaryTextfield(
              controller: controller.pw2Controller,
              labelText: 'Confirm Password',
            ),
            PrimaryElevatedButton(
                buttonName: 'Change Password',
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteName.rLogin);
                }),
          ],
        ),
      ),
    );
  }
}
