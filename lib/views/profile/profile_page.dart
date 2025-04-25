import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/views/profile/model/profile_utility_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildText(
          context,
          text: 'Profile Screen',
          themeSelect: (t) => t.titleMedium!,
        ),
      ),
      body: PrimaryPadding(
        child: SingleChildScrollView(
          child: Column(
            spacing: 10.0,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: getScreenSize(context).width * 0.4,
                width: getScreenSize(context).width * 0.85,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 184, 182, 182),
                    borderRadius: BorderRadius.circular(10.0)),
                child: PrimaryPadding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                          radius: 46,
                          backgroundColor: CommonColor.cOrangeColor,
                          child: CircleAvatar(
                            backgroundColor: CommonColor.cBlueColor,
                            radius: 45,
                          )),
                      buildText(
                        context,
                        text: 'Confused Student',
                        themeSelect: (t) => t.bodyMedium!,
                      ),
                      buildText(
                        context,
                        text: 'student2020@gmail.com',
                        themeSelect: (t) => t.bodySmall!,
                      ),
                    ],
                  ),
                ),
              ),
              ListView.separated(
                itemCount: ProfileListModel.profileList(context).length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final data = ProfileListModel.profileList(context)[index];
                  return Card(
                    child: data.text == 'Theme'
                        ? SwitchListTile(
                            value: isDark,
                            onChanged: (value) {
                              setState(() {
                                isDark = value;
                              });
                            },
                            title: buildText(
                              context,
                              text: data.text,
                              themeSelect: (t) => t.bodySmall!,
                            ),
                            secondary: Icon(data.icon),
                          )
                        : InkWell(
                            onTap: data.onPressed,
                            child: ListTile(
                              leading: Icon(
                                data.icon,
                                color: data.icon == Icons.logout
                                    ? CommonColor.cRedColor
                                    : null,
                              ),
                              title: buildText(
                                context,
                                text: data.text,
                                themeSelect: (t) => t.bodySmall!.copyWith(
                                  color:  data.text == 'Logout'
                                    ? CommonColor.cRedColor
                                    : null,
                                ),
                              ),
                            ),
                          ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
