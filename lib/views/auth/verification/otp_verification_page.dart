import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/views/auth/verification/widgets/app_bar_style.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: appBarStyle(
          text: 'OTP Verification',
          onPressed: () {
            Navigator.of(context).pushNamed(RouteName.rForgotPassword);
          }),      
      body: SingleChildScrollView(
        child: Column(
          spacing: 20.0,
          children: [
            PrimaryImage(path: [CommonImage.iOtpImage]),
            buildText(
              context,
              text: 'Enter verification code sent to you email',
              themeSelect: (t) => t.bodyMedium!,
            ),
            Pinput(
              length: 6,
              defaultPinTheme: _buildPinput(),
              focusedPinTheme: _buildPinput(CommonColor.cPurpleColor),
              submittedPinTheme: _buildPinput(CommonColor.cBlueColor),
            ),
            PrimaryElevatedButton(
                buttonName: 'Verify',
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteName.rChangePassword);
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildText(
                  context,
                  text: 'Received Code ?',
                  themeSelect: (t) => t.bodySmall!,
                ),
                buildText(
                  context,
                  text: ' Send Code',
                  themeSelect: (t) => t.bodySmall!.copyWith(
                    color: CommonColor.cBlueColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

_buildPinput([Color color = CommonColor.cBlackColor]) => PinTheme(
    width: 45,
    height: 45,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      border: Border.all(color: color, width: 1.0),
    ));
