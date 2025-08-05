import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/AllScreen/3dWallpaperScreen/3dWallpaperScreen.dart';
import 'package:wallpaper/AllScreen/SplashScreen.dart';
import 'package:wallpaper/Controller/WallpaperController.dart';
import 'package:wallpaper/Style.dart';
import 'package:wallpaper/ThemeModel.dart';

void main() async {
  Get.put(WallpaperController());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 // DarkThemeProvider themeChangeProvider = new DarkThemeProvider();


  @override
  void initState() {
    super.initState();
   // getCurrentAppTheme();
  }

/*  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreference.getTheme();
  }*/

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DarkModeProvider(),
      child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),

            home: SplashScreen(),
          )


    );
  }
}
//https://wallpapers.virmana.com/api/category/all/4F5A9C3D9A86FA54EACEDDD635185/16edd7cf-2525-485e-b11a-3dd35f382457/
//https://wallpapers.virmana.com/api/wallpaper/category/1/2/4F5A9C3D9A86FA54EACEDDD635185/16edd7cf-2525-485e-b11a-3dd35f382457/
//https://wallpapers.virmana.com/api/wallpaper/category/0/1/4F5A9C3D9A86FA54EACEDDD635185/16edd7cf-2525-485e-b11a-3dd35f382457/