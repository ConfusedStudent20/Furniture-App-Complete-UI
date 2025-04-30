import 'package:furniture_yt/cores/consts/const.dart';

class AppTheme {
  static _border([Color color = CommonColor.cBlackColor]) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: color,
          width: 1.0,
        ),
      );

  ThemeData get lightTheme => ThemeData(
        cardColor: CommonColor.cCardColor,
        scaffoldBackgroundColor: CommonColor.cScaffoldBackgroundColor,

// app bar theme
        appBarTheme: AppBarTheme(
          backgroundColor: CommonColor.cAppBarColor,
          titleTextStyle: TextStyle(
            color: CommonColor.cBlackColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(
            color: CommonColor.cBlackColor,
            size: 25,
          ),
        ),

// card theme
        cardTheme: CardThemeData(
          color: CommonColor.cCardColor,
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
// bottom navigation bar theme

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: CommonColor.cBottomNavColor,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(color: CommonColor.cBlueColor),
          unselectedIconTheme: IconThemeData(color: CommonColor.cBlackColor),
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(color: CommonColor.cBlueColor),
          unselectedLabelStyle: TextStyle(color: CommonColor.cBlackColor),
          showSelectedLabels: true,
        ),
// input decoration theme
        inputDecorationTheme: InputDecorationTheme(
          border: _border(),
          focusedBorder: _border(CommonColor.cPurpleColor),
          errorBorder: _border(CommonColor.cRedColor),
        ),
        // list tile theme
        listTileTheme: ListTileThemeData(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: CommonColor.cBlackColor, width: 1.0),
          ),
          tileColor: CommonColor.cTileColor,
        ),

// tab bar theme

        tabBarTheme: TabBarThemeData(
          indicatorColor: CommonColor.cBlueColor,
          unselectedLabelColor: CommonColor.cBlackColor,
          labelColor: CommonColor.cBlueColor,
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          unselectedLabelStyle:
              TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        // text theime
        textTheme: TextTheme(
          titleMedium: TextStyle(
            color: CommonColor.cBlackColor,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          titleSmall: TextStyle(
            color: CommonColor.cBlackColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(
            color: CommonColor.cBlackColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          bodySmall: TextStyle(
            color: CommonColor.cBlackColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          labelSmall: TextStyle(
            color: CommonColor.cBlackColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),

// elevatedButton Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),

        // outlined button theme
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      );

  ThemeData get darkTheme => ThemeData(
        cardColor: CommonColor.cBlackCardColor,

        scaffoldBackgroundColor: CommonColor.cScaffoldBlackColor,

// app bar theme
        appBarTheme: AppBarTheme(
          backgroundColor: CommonColor.cAppBarColor,
          titleTextStyle: TextStyle(
            color: CommonColor.cWhiteColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(
            color: CommonColor.cWhiteColor,
            size: 25,
          ),
        ),

// card theme
        cardTheme: CardThemeData(
          color: CommonColor.cBlackCardColor,
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
// bottom navigation bar theme

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: CommonColor.cBlackCardColor,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(color: CommonColor.cBlueColor),
          unselectedIconTheme: IconThemeData(color: CommonColor.cWhiteColor),
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(color: CommonColor.cBlueColor),
          unselectedLabelStyle: TextStyle(color: CommonColor.cWhiteColor),
          showSelectedLabels: true,
        ),
// input decoration theme
        inputDecorationTheme: InputDecorationTheme(
          border: _border(),
          focusedBorder: _border(CommonColor.cPurpleColor),
          errorBorder: _border(CommonColor.cRedColor),
        ),
        // list tile theme
        listTileTheme: ListTileThemeData(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: CommonColor.cWhiteColor, width: 1.0),
          ),
          tileColor: CommonColor.cBlackCardColor,
        ),

// tab bar theme

        tabBarTheme: TabBarThemeData(
          indicatorColor: CommonColor.cBlueColor,
          unselectedLabelColor: CommonColor.cWhiteColor,
          labelColor: CommonColor.cBlueColor,
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          unselectedLabelStyle:
              TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        // text theime
        textTheme: TextTheme(
          titleMedium: TextStyle(
            color: CommonColor.cWhiteColor,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          titleSmall: TextStyle(
            color: CommonColor.cWhiteColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(
            color: CommonColor.cWhiteColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          bodySmall: TextStyle(
            color: CommonColor.cWhiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          labelSmall: TextStyle(
            color: CommonColor.cWhiteColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),

// elevatedButton Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),

        // outlined button theme
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      );
}
