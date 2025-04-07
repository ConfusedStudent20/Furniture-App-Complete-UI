import 'package:furniture_yt/cores/consts/const.dart';

class PrimaryImage extends StatelessWidget {
  final List<String> path;
  final BoxFit? fit;
  final double? height;
  final double? width;
  const PrimaryImage({
    super.key,
    required this.path,
    this.fit,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final size = getScreenSize(context);
    return Image.asset(
      path[0],
      fit: fit ?? BoxFit.cover,
      height: height ?? size.height * 0.4,
      width: width ?? size.width * 0.8,
    );
  }
}
