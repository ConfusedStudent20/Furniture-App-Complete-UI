import 'package:furniture_yt/cores/consts/const.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final controller = PrimaryTexteditingController();
  final txt = CommonString();
  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildText(
          context,
          text: 'Edit Profile',
          themeSelect: (t) => t.titleMedium!,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: PrimaryPadding(
          child: Column(
        spacing: 10.0,
        children: [
          PrimaryTextfield(
            controller: controller.usernameController,
            labelText: txt.sUsername,
            keyboardType: TextInputType.text,
          ),
          PrimaryTextfield(
            controller: controller.emailController,
            labelText: txt.sEmailAddress,
            keyboardType: TextInputType.emailAddress,
          ),
          PrimaryTextfield(
            controller: controller.nameController,
            labelText: txt.sName,
            keyboardType: TextInputType.name,
          ),
          PrimaryTextfield(
            controller: controller.passwordController,
            labelText: txt.sPassword,
            keyboardType: TextInputType.text,
          ),
          PrimaryTextfield(
            controller: controller.phoneController,
            labelText: txt.sPhone,
            keyboardType: TextInputType.phone,
          ),
          PrimaryOutlinedButton(
            buttonName: 'Save',
            onPressed: () {},
          )
        ],
      )),
    );
  }
}
