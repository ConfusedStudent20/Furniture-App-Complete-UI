import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/views/auth/verification/widgets/app_bar_style.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final controller = PrimaryTexteditingController();
  final txt = CommonString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStyle(
          text: 'Forgot Password',
          onPressed: () {
            Navigator.of(context).pushNamed(RouteName.rLogin);
          }),
      body: PrimaryPadding(
        child: SingleChildScrollView(
          child: Column(
            spacing: 10.0,
            children: [
              PrimaryImage(
                path:[ CommonImage.iForgotPassword],
                height: getScreenSize(context).height * 0.5,
              ),
              buildText(
                context,
                text: 'Please enter your email to send otp code',
                themeSelect: (t) => t.bodyMedium!,
              ),
              PrimaryTextfield(
                controller: controller.emailController,
                labelText: txt.sEmailAddress,
                keyboardType: TextInputType.emailAddress,
              ),
              PrimaryElevatedButton(
                  buttonName: 'Send Code',
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteName.rOtpVerification);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
