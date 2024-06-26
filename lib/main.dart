import 'package:flutter/material.dart';
import 'package:flutter_node_store/app_router.dart';
import 'package:flutter_node_store/themes/styles.dart';
import 'package:flutter_node_store/utils/utility.dart';






// กำหนดตัวแปร initialRoute ให้กับ MaterialApp
var initialRoute;

void main() async {

  // Test Logger
 // Utility().testLogger();
  // testLogger();

  // ต้องเรียกใช้ WidgetsFlutterBinding.ensureInitialized()
  // เพื่อให้สามารถเรียกใช้ SharedPreferences ได้
  WidgetsFlutterBinding.ensureInitialized();

  // เพื่อเรียกใช้ SharedPreferences
   await Utility.initSharedPerfs();

  // ตรวจสอบว่าเคยแสดง Intro แล้วหรือยัง 
  if(Utility.getSharedPreference('welcomeStatus') == true) {
    // ถ้าเคยแสดง Intro แล้ว ให้ไปยังหน้า Login
    initialRoute = AppRouter.login;
  } else if(Utility.getSharedPreference('loginStatus') == true) {
    // ถ้าเคย login แล้วให้ไป Dashboard
    initialRoute = AppRouter.dashboard;
  } else {
    // ถ้ายังไม่เคยแสดง Intro ให้ไปยังหน้า Welcome
    initialRoute = AppRouter.welcome;
  }

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: initialRoute,
      routes: AppRouter.routes,
    );
  }
}
