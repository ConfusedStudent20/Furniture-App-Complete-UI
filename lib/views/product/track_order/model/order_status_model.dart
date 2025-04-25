import 'package:furniture_yt/cores/consts/const.dart';

class OrderStatus {
  final String title;
  final DateTime dateTime;
  final IconData icon;
  OrderStatus({
    required this.title,
    required this.dateTime,
    required this.icon,
  });
}

class OrderStatusModel {
  static final List<OrderStatus> orderStatusModel = [
    OrderStatus(
      title: 'Order Placed',
      dateTime: DateTime.now(),
      icon: Icons.receipt,
    ),
    OrderStatus(
      title: 'In Progress',
      dateTime: DateTime.utc(2024, 7, 20, 20, 18, 04),
      icon: Icons.inventory,
    ),
    OrderStatus(
      title: 'Shipped',
      dateTime: DateTime.utc(2025, 7, 20, 20, 18, 04),
      icon: Icons.local_shipping,
    ),
    OrderStatus(
      title: 'Delivered',
      dateTime: DateTime.utc(2025, 8, 20, 20, 18, 04),
      icon: Icons.check_circle,
    ),
  ];
}
