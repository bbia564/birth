
import 'package:birthday_record/db_birthday/db_birthday.dart';
import 'package:birthday_record/pages/birthday_cof/birthday_cof_binding.dart';
import 'package:birthday_record/pages/birthday_cof/birthday_cof_view.dart';
import 'package:birthday_record/pages/birthday_first/birthday_first_binding.dart';
import 'package:birthday_record/pages/birthday_first/birthday_first_view.dart';
import 'package:birthday_record/pages/birthday_second/birthday_input_f.dart';
import 'package:birthday_record/pages/birthday_second/birthday_second_binding.dart';
import 'package:birthday_record/pages/birthday_second/birthday_second_view.dart';
import 'package:birthday_record/pages/birthday_tab/birthday_tab_binding.dart';
import 'package:birthday_record/pages/birthday_tab/birthday_tab_view.dart';
import 'package:birthday_record/pages/birthday_third/birthday_third_binding.dart';
import 'package:birthday_record/pages/birthday_third/birthday_third_view.dart';
import 'package:birthday_record/pages/no_network/no_network_binding.dart';
import 'package:birthday_record/pages/no_network/no_network_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Color primaryColor = const Color(0xffff8900);
Color bgColor = const Color(0xfffafafa);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBBirthday().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Soa,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Soa = [
  GetPage(name: '/', page: () => const BirthdayCofView(), binding: BirthdayCofBinding()),
  GetPage(name: '/birthday_first', page: () => BirthdayFirstPage(), binding: BirthdayFirstBinding()),
  GetPage(name: '/birthday_second', page: () => BirthdaySecondPage(), binding: BirthdaySecondBinding()),
  GetPage(name: '/birthday_third', page: () => BirthdayThirdPage(), binding: BirthdayThirdBinding()),
  GetPage(name: '/birthday_tab', page: () => BirthdayTabPage(), binding: BirthdayTabBinding()),
  GetPage(name: '/birthday_inp', page: () => const BirthdayInputF()),
  GetPage(name: '/no_network', page: () => NoNetworkPage(), binding: NoNetworkBinding()),
];
