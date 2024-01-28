import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hookah_user/controller/instance_binding.dart';
import 'package:hookah_user/controller/routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book My Smoke',
      builder: EasyLoading.init(),
      initialBinding: InstanceBinding(),
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF020D4D),
        ),
        canvasColor: const Color.fromARGB(255, 236, 237, 241),
        textTheme: GoogleFonts.poppinsTextTheme(
          const TextTheme(
            titleMedium: TextStyle(fontSize: 20),
          ),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          toolbarHeight: 70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        chipTheme: const ChipThemeData(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          selectedColor: Color(0xFF020D4D),
          disabledColor: Color(0xffE3E2E2),
          labelStyle: TextStyle(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
            ),
          ),
        ),
      ),
      // home: Login(),
      initialRoute: "SPLASH_SCREEN",
      // initialRoute: "TAB_CONTROLLER_PAGE",
      getPages: getPages,
    );
  }
}
