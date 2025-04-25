import 'package:furniture_yt/cores/consts/const.dart';

class StepsModel {
  final String title;
  final String date;
  final IconData icon;
  final bool isCompleted;
  final bool isCurrent;
  final bool isLast;

  StepsModel({
    required this.title,
    required this.date,
    required this.icon,
    required this.isCompleted,
    required this.isCurrent,
    required this.isLast,
  });
}
