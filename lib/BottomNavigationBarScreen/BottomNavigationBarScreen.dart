import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/AllScreen/3dWallpaperScreen/3dWallpaperScreen.dart';
import 'package:wallpaper/AllScreen/ExitScreen.dart';
import 'package:wallpaper/AllScreen/InternetScreen.dart';
import 'package:wallpaper/AllScreen/LiveWallpaperScreen/LiveWallpaperScreen.dart';
import 'package:wallpaper/Controller/WallpaperController.dart';
import 'package:wallpaper/ThemeModel.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  var currentindex = 0;
  List pages = [ThreedWallpaper(), LiveWallpaper()];
  WallpaperController wallpaperController=Get.find();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    wallpaperController.subscription.cancel();
  }
  void getconnectivity(){
    wallpaperController.subscription = Connectivity().onConnectivityChanged.listen((event) async {
      wallpaperController.isdeviceconnected.value =
      await InternetConnectionChecker().hasConnection;
      if (!wallpaperController.isdeviceconnected.value) {
        showDialog(
          context: context,
          builder: (context) {
            return InternetScreen();
          },
        );
        setState(() {
          wallpaperController.isalertset.value = true;
        });
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wallpaperController.getdata();
    getconnectivity();
  }

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(context);
    return Scaffold(
        backgroundColor:!darkModeProvider.isDarkMode? Color(0xff1b2234):Colors.white,
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 65,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
            child: !darkModeProvider.isDarkMode?
            BottomNavigationBar(
                onTap: (value) {
                  setState(() {
                    currentindex = value;
                  });
                },
                backgroundColor: Color(0xff343b4e),
                elevation: 0,
                unselectedFontSize: 0,
                selectedFontSize: 0,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: currentindex,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: currentindex == 0
                          ? Image.asset(
                              "images/first_active.png",
                              width: 35,
                              height: 35,
                            )
                          : Image.asset(
                              "images/first_none.png",
                              width: 35,
                              height: 35,
                            ),
                      label: "first"),
                /*  BottomNavigationBarItem(
                      icon: currentindex == 1
                          ? Image.asset(
                              "images/second_active.png",
                              width: 35,
                              height: 35,
                            )
                          : Image.asset(
                              "images/second_none.png",
                              width: 37,
                              height: 37,
                            ),
                      label: "second"),*/
                  BottomNavigationBarItem(
                      icon: currentindex == 1
                          ? Image.asset(
                              "images/third_active.png",
                              width: 32,
                              height: 32,
                            )
                          : Image.asset(
                              "images/third_none.png",
                              width: 32,
                              height: 32,
                            ),
                      label: "third")
                ]):
            BottomNavigationBar(
                onTap: (value) {
                  setState(() {
                    currentindex = value;
                  });
                },
                backgroundColor: Color(0xffeeeeee),
                elevation: 0,
                unselectedFontSize: 0,
                selectedFontSize: 0,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: currentindex,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: currentindex == 0
                          ? Image.asset(
                        "images/first_active.png",
                        width: 35,
                        height: 35,
                        color: Colors.black,
                      )
                          : Image.asset(
                        "images/first_none.png",
                        width: 35,
                        height: 35,
                        color:Color(0xffa8a8a8),
                      ),
                      label: "first"),
                  /*  BottomNavigationBarItem(
                      icon: currentindex == 1
                          ? Image.asset(
                              "images/second_active.png",
                              width: 35,
                              height: 35,
                            )
                          : Image.asset(
                              "images/second_none.png",
                              width: 37,
                              height: 37,
                            ),
                      label: "second"),*/
                  BottomNavigationBarItem(
                      icon: currentindex == 1
                          ? Image.asset(
                        "images/third_active.png",
                        width: 32,
                        height: 32,
                        color: Colors.black,
                      )
                          : Image.asset(
                        "images/third_none.png",
                        width: 32,
                        height: 32,
                        color:Color(0xffa8a8a8),
                      ),
                      label: "third")
                ]),
          ),
        ),
        body: WillPopScope(
          onWillPop: () async {
            return await showDialog(
              context: context,
              builder: (context) {
                return ExitScreen();
              },
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: pages[currentindex],
          ),
        ));
  }
}
