import 'package:furniture_yt/cores/consts/image.dart';

class SocialIconModel {
  final List<String> path;
  SocialIconModel({required this.path});
}

class SocialIcon {
  static final List<SocialIconModel> socialIcons = [
    SocialIconModel(path: [
      CommonImage.iFacebook,
      CommonImage.iGoogle,
      CommonImage.iApple,
    ])
  ];
}
