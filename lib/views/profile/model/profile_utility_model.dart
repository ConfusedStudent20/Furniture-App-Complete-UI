import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/cores/primary/primary_text_button.dart';

class ProfileUtilityModel {
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;

  ProfileUtilityModel({
    required this.text,
    required this.icon,
    this.onPressed,
  });
}

class ProfileListModel {
  static List<ProfileUtilityModel> profileList(BuildContext context) {
    return [
      ProfileUtilityModel(
        text: 'Theme',
        icon: Icons.sunny,
      ),
      ProfileUtilityModel(
          text: 'Edit Profile',
          icon: Icons.edit,
          onPressed: () {
            Navigator.of(context).pushNamed(RouteName.rEdit);
          }),
      ProfileUtilityModel(
          text: 'Payment Method',
          icon: Icons.payment,
          onPressed: () {
            Navigator.of(context).pushNamed(RouteName.rPayment);
          }),
      ProfileUtilityModel(
          text: 'Settings',
          icon: Icons.settings,
          onPressed: () {
            Navigator.of(context).pushNamed(RouteName.rSettings);
          }),
      ProfileUtilityModel(
          text: 'My Orders',
          icon: Icons.attach_money,
          onPressed: () {
            Navigator.of(context).pushNamed(RouteName.rMyOrders);
          }),
      ProfileUtilityModel(
          text: 'My Address',
          icon: Icons.location_on,
          onPressed: () {
            Navigator.of(context).pushNamed(RouteName.rMyAddress);
          }),
      ProfileUtilityModel(
          text: 'Logout',
          icon: Icons.logout,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: buildText(
                      context,
                      text: 'Logout',
                      themeSelect: (t) => t.bodyMedium!,
                    ),
                    content: buildText(
                      context,
                      text: 'Are you sure to exit the app ?',
                      themeSelect: (t) => t.bodySmall!,
                    ),
                    backgroundColor: const Color.fromARGB(255, 192, 192, 192),
                    actions: [
                      Row(
                        spacing: 15.0,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PrimaryTextButton(
                              buttonName: 'No',
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                          PrimaryElevatedButton(
                            buttonName: 'Yes',
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(RouteName.rLogin);
                            },
                            size: Size(100, 40),
                          )
                        ],
                      ),
                    ],
                  );
                });
          })
    ];
  }
}
