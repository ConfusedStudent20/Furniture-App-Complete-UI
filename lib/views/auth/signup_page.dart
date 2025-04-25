import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/views/auth/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final controller = PrimaryTexteditingController();
  final txt = CommonString();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                PrimaryImage(
              path: [CommonImage.iLog],
                )
              ],
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: CommonColor.cContainerColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      30.0,
                    ),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: PrimaryPadding(
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 10.0,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildText(
                          context,
                          text: txt.sSignup,
                          themeSelect: (t) => t.titleMedium!,
                        ),
                        // r
                        PrimaryTextfield(
                          controller: controller.emailController,
                          labelText: txt.sEmailAddress,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        PrimaryTextfield(
                          controller: controller.passwordController,
                          labelText: txt.sPassword,
                        ),
                        PrimaryTextfield(
                          controller: controller.usernameController,
                          labelText: txt.sUsername,
                        ),
                        PrimaryTextfield(
                          controller: controller.phoneController,
                          labelText: txt.sPhone,
                          keyboardType: TextInputType.phone,
                        ),

                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            Expanded(
                              child: RichText(
                                  text: TextSpan(
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                      children: [
                                    TextSpan(text: 'By signing up,'),
                                    TextSpan(text: 'you agree to our'),
                                    TextSpan(
                                      text: 'Terms of Service',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: CommonColor.cBlueColor),
                                    ),
                                    TextSpan(text: ' and '),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: CommonColor.cBlueColor),
                                    ),
                                  ])),
                            )
                          ],
                        ),

                        PrimaryElevatedButton(
                          buttonName: txt.sSignup,
                          onPressed: () {},
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildText(
                              context,
                              text: txt.sHaveAccount,
                              themeSelect: (t) => t.bodySmall!,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacementNamed(RouteName.rLogin);
                              },
                              child: buildText(
                                context,
                                text: txt.sLogin,
                                themeSelect: (t) => t.bodyMedium!
                                    .copyWith(color: CommonColor.cBlueColor),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
