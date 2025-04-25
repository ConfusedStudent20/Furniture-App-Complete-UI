import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/views/auth/model/social_icon_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                          text: txt.sLogin,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(value: true, onChanged: (value) {}),
                                buildText(
                                  context,
                                  text: txt.sRememberMe,
                                  themeSelect: (t) => t.bodySmall!,
                                ),
                              ],
                            ),
                            buildText(
                              context,
                              text: txt.sForgotPassword,
                              themeSelect: (t) => t.bodySmall!.copyWith(
                                color: CommonColor.cBlueColor,
                              ),
                              onPressed: () => Navigator.of(context)
                                  .pushReplacementNamed(
                                      RouteName.rForgotPassword),
                            ),
                          ],
                        ),
                        PrimaryElevatedButton(
                          buttonName: txt.sLogin,
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(RouteName.rMain);
                          },
                        ),

                        buildText(
                          context,
                          text: 'OR',
                          themeSelect: (t) => t.titleSmall!,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10.0,
                          children: List.generate(
                              SocialIcon.socialIcons[0].path.length,
                              (index) => CircleAvatar(
                                    backgroundColor:
                                        CommonColor.cTransparentColor,
                                    radius: 25,
                                    backgroundImage: AssetImage(
                                      SocialIcon.socialIcons[0].path[index],
                                    ),
                                  )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildText(
                              context,
                              text: txt.sNoAccount,
                              themeSelect: (t) => t.bodySmall!,
                            ),
                            buildText(context,
                                text: txt.sSignup,
                                themeSelect: (t) => t.bodyMedium!
                                    .copyWith(color: CommonColor.cBlueColor),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed(RouteName.rSignup);
                                })
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
