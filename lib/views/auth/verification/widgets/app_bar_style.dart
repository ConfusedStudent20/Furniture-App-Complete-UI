import 'package:furniture_yt/cores/consts/const.dart';

AppBar appBarStyle({
  required String text,
  VoidCallback? onPressed,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text(text),
    leading: IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.arrow_back),
    ),
  );
}
