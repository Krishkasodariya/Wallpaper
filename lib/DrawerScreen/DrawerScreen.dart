import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wallpaper/AllScreen/InternetScreen.dart';
import 'package:wallpaper/Controller/WallpaperController.dart';
import 'package:wallpaper/DrawerScreen/DownloadScreen.dart';
import 'package:wallpaper/DrawerScreen/FavouriteScreen.dart';
import 'package:wallpaper/DrawerScreen/RatingScreen.dart';
import 'package:wallpaper/ThemeModel.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  WallpaperController wallpaperController = Get.find();
  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(context);

        return SafeArea(
          child: Scaffold(
              backgroundColor:!darkModeProvider.isDarkMode? Color(0xff1b2234):Colors.white,
              body: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                   height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Get.back();
                                  });
                                },
                                child: !darkModeProvider.isDarkMode?Image(
                                  image: AssetImage("images/back.png"),
                                  width: 28,
                                  height: 28,
                                  color: Colors.white,
                                ):Image(
                                  image: AssetImage("images/back.png"),
                                  width: 28,
                                  height: 28,
                                  color: Colors.black,
                                )),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Text(
                                "Menu",
                                style: TextStyle(
                                    color: !darkModeProvider.isDarkMode?Colors.white:Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ListTile(
                          leading:!darkModeProvider.isDarkMode
                              ? Text("Dark Mode",
                                  style: GoogleFonts.nunito(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: !darkModeProvider.isDarkMode?Colors.white:Colors.black,))
                              : Text("Light Mode",
                                  style: GoogleFonts.nunito(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color:!darkModeProvider.isDarkMode?Colors.white:Colors.black,)),
                          trailing: Switch(
                            value:darkModeProvider.isDarkMode,
                              activeColor: !darkModeProvider.isDarkMode?Color(0xff68728d):Colors.black,
                              onChanged: (value) {
                              setState(() {
                                darkModeProvider.toggleDarkMode();
                              });

                            },
                          )
                          /*    GestureDetector(
                          onTap: () {
                            setState(() {
                              themenotifier.isDark?false:true;
                              wallpaperController.chageswitch.value = !wallpaperController.chageswitch.value;
                              if(!wallpaperController.chageswitch.value){
                                themenotifier.isDark=true;
                                print("isDark");
                              }else{
                                themenotifier.isDark=false;
                                print("fwfwfwf");
                              }
                            });
                          },
                          child: wallpaperController.chageswitch.value
                              ? Image(
                                  image: AssetImage("images/switchon.png"),
                                  width: 47,
                                  height: 47,
                                )
                              : Image(
                                  image: AssetImage("images/switchoff.png"),
                                  width: 47,
                                  height: 47,
                                ),
                        ),*/

                          ),
                      SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => DownloadScreen());
                        },
                        child: ListTile(
                          leading: Text("Download",
                              style: GoogleFonts.nunito(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color:!darkModeProvider.isDarkMode?Colors.white:Colors.black,)),
                          trailing: !darkModeProvider.isDarkMode?Image(
                            image: AssetImage("images/forward_arrow.png"),
                            width: 25,
                            height: 25,
                          ):Image(
                            image: AssetImage("images/forward_arrow.png"),
                            width: 25,
                            height: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => FavouriteScreen());
                        },
                        child: ListTile(
                          leading: Text("Favourite",
                              style: GoogleFonts.nunito(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color:!darkModeProvider.isDarkMode?Colors.white:Colors.black,)),
                          trailing: !darkModeProvider.isDarkMode?Image(
                            image: AssetImage("images/forward_arrow.png"),
                            width: 25,
                            height: 25,
                          ):Image(
                            image: AssetImage("images/forward_arrow.png"),
                            width: 25,
                            height: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return RatingScreen();
                            },
                          );
                        },
                        child: ListTile(
                          leading: Text("Rating & Reviews",
                              style: GoogleFonts.nunito(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: !darkModeProvider.isDarkMode?Colors.white:Colors.black,)),
                          trailing:  !darkModeProvider.isDarkMode?Image(
                            image: AssetImage("images/forward_arrow.png"),
                            width: 25,
                            height: 25,
                          ):Image(
                            image: AssetImage("images/forward_arrow.png"),
                            width: 25,
                            height: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Share.share("com.example.wallpaper");
                        },
                        child: ListTile(
                          leading: Text("Share This App",
                              style: GoogleFonts.nunito(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color:!darkModeProvider.isDarkMode?Colors.white:Colors.black,)),
                          trailing:  !darkModeProvider.isDarkMode?Image(
                            image: AssetImage("images/forward_arrow.png"),
                            width: 25,
                            height: 25,
                          ):Image(
                            image: AssetImage("images/forward_arrow.png"),
                            width: 25,
                            height: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ListTile(
                        leading: Text("Privacy Policy",
                            style: GoogleFonts.nunito(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color:!darkModeProvider.isDarkMode?Colors.white:Colors.black,)),
                        trailing: !darkModeProvider.isDarkMode?Image(
                          image: AssetImage("images/forward_arrow.png"),
                          width: 25,
                          height: 25,
                        ):Image(
                          image: AssetImage("images/forward_arrow.png"),
                          width: 25,
                          height: 25,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ListTile(
                        leading: Text("Version",
                            style: GoogleFonts.nunito(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: !darkModeProvider.isDarkMode?Colors.white:Colors.black,)),
                        trailing: Text("V2.1.0",
                            style: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: !darkModeProvider.isDarkMode?Color(0xff68728d):Colors.black)),
                      ),
                    ],
                  ),
                ),
              )),
        );

  }
}
