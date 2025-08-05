import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/Controller/WallpaperController.dart';
import 'package:wallpaper/ThemeModel.dart';

class DownloadFailed extends StatefulWidget {
  const DownloadFailed({Key? key}) : super(key: key);

  @override
  State<DownloadFailed> createState() => _DownloadFailedState();
}

class _DownloadFailedState extends State<DownloadFailed> {
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
                    Lottie.asset("images/failed.json")
                )),
            Text("Download Failed",style: GoogleFonts.nunito(fontSize: 23,color: Color(0xffff4e4e),fontWeight: FontWeight.w600),)
          ],
        ),
      ),
    );
  }
}
