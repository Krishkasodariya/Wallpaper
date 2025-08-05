import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/Controller/WallpaperController.dart';
import 'package:wallpaper/ThemeModel.dart';

class DownloadSuccess extends StatefulWidget {
  const DownloadSuccess({Key? key}) : super(key: key);

  @override
  State<DownloadSuccess> createState() => _DownloadSuccessState();
}

class _DownloadSuccessState extends State<DownloadSuccess> {
  WallpaperController wallpaperController = Get.find();

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(context);
    return Scaffold(
      backgroundColor:!darkModeProvider.isDarkMode? Color(0xff1b2234):Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
                child: Container(
                    width: 250,
                    height: 250,
                    child:
                         Lottie.asset("images/success.json")
                      )),
            Text("Download Success",style: GoogleFonts.nunito(fontSize: 23,color: Color(0xff3290FE),fontWeight: FontWeight.w600),)
          ],
        ),
      ),
    );
  }
}
