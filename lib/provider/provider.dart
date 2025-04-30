import 'package:furniture_yt/cores/consts/const.dart';

// 1. currentIndex provider
final currentIndexProvider = StateProvider<int>((ref) => 0);

// 2. theme Provider
final appThemeProvider = StateProvider<bool>((ref) => false);

// 3. isExpanded Provider
final isExpandedProvider = StateProvider<bool>((ref) => false);

// 4. selectedImage Provider
final selectedImageProvider = StateProvider<String>((ref) => '');
