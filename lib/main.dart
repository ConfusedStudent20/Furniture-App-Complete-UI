import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/cores/routes/routes.dart';
import 'package:furniture_yt/cores/theme/app_theme.dart';
import 'package:furniture_yt/main_screen.dart';
import 'package:furniture_yt/views/auth/login_page.dart';
import 'package:furniture_yt/views/auth/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().lightTheme,
      onGenerateRoute: Routes.generateRoute,
      home: MainScreen(),
    );
  }
}
