import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wallpaper/AllScreen/3dWallpaperScreen/DownloadFailed.dart';
import 'package:wallpaper/AllScreen/3dWallpaperScreen/DownloadSuccess.dart';
import 'package:wallpaper/AllScreen/LiveWallpaperScreen/LiveWallpaperScreen.dart';
import 'package:wallpaper/Controller/WallpaperController.dart';
import 'package:wallpaper/ModelClass/LiveImageModel.dart';
import 'package:wallpaper/ThemeModel.dart';

class ViewOnScreen extends StatefulWidget {
  int index;
  String name;
  String image;

  ViewOnScreen({Key? key, required this.index,required this.name,required this.image}) : super(key: key);

  @override
  State<ViewOnScreen> createState() => _ViewOnScreenState();
}

class _ViewOnScreenState extends State<ViewOnScreen> {
  WallpaperController wallpaperController = Get.find();
  List<String> shareimages = [];
  String? fileName;
  String? savePath;
  final cacheManager = CacheManager(Config("cacheKey",
      stalePeriod: Duration(days: 15), maxNrOfCacheObjects: 100));

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            !darkModeProvider.isDarkMode ? Color(0xff1b2234) : Colors.white,
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Container(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: CachedNetworkImage(
                    cacheManager: cacheManager,
                    key: UniqueKey(),
                    imageUrl:
                        "${widget.image}",
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Image(
                                image: AssetImage("images/back.png"),
                                width: 28,
                                height: 28,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: Container(

                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                            "${widget.name} Wallpaper",
                                            style: GoogleFonts.nunito(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                            maxLines: 1,
                                            overflow: TextOverflow.visible),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                            "@${widget.name}",
                                            style: GoogleFonts.nunito(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Center(
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    wallpaperController
                                                            .imageTypelist
                                                            .value[widget.index]
                                                            .Like =
                                                        !wallpaperController
                                                            .imageTypelist
                                                            .value[widget.index]
                                                            .Like!;
                                                  });

                                                  if (wallpaperController
                                                      .imageTypelist
                                                      .value[widget.index]
                                                      .Like!) {
                                                    wallpaperController
                                                        .favouritelist.value
                                                        .add((wallpaperController
                                                                .imageTypelist
                                                                .value[
                                                            widget.index]));
                                                  } else {
                                                    for (int i = 0;
                                                        i <
                                                            wallpaperController
                                                                .favouritelist
                                                                .value
                                                                .length;
                                                        i++) {
                                                      if (wallpaperController
                                                                  .imageTypelist
                                                                  .value[
                                                              widget.index] ==
                                                          wallpaperController
                                                              .favouritelist
                                                              .value[i]) {
                                                        wallpaperController
                                                            .favouritelist.value
                                                            .remove(wallpaperController
                                                                    .imageTypelist
                                                                    .value[
                                                                widget.index]);
                                                      }
                                                    }
                                                  }
                                                },
                                                child: wallpaperController
                                                        .imageTypelist
                                                        .value[widget.index]
                                                        .Like!
                                                    ? Image(
                                                        image: AssetImage(
                                                            "images/fill_like.png"),
                                                        width: 30,
                                                        height: 30,
                                                      )
                                                    : Image(
                                                        image: AssetImage(
                                                            "images/empty_like.png"),
                                                        width: 30,
                                                        height: 30,
                                                      )),
                                            Text("Like",
                                                style: GoogleFonts.nunito(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Center(
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                final uri = Uri.parse(
                                                    "${wallpaperController.imageTypelist.value[widget.index].image}");
                                                final res = await http.get(uri);
                                                final bytes = res.bodyBytes;

                                                final temp =
                                                    await getTemporaryDirectory();
                                                final time =
                                                    'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
                                                final path =
                                                    "${temp.path + '/' + time}";
                                                File(path).writeAsBytes(bytes);

                                                await Share.shareFiles([path]);
                                              },
                                              child: Image(
                                                image: AssetImage(
                                                    "images/share.png"),
                                                width: 30,
                                                height: 30,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text("Share",
                                                style: GoogleFonts.nunito(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Center(
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  print("-------)${  wallpaperController.isdownloading.value}");
                                                  if(  wallpaperController.isdownloading.value) {

                                                    null;
                                                    print("-------)${  wallpaperController.isdownloading.value}");
                                                  }
                                                  else {downloadAndStoreImage();}
                                                },
                                                child: wallpaperController
                                                        .isdownloading.value
                                                    ? Center(
                                                        child: Container(
                                                            width: 30,
                                                            height: 30,
                                                            child: Lottie.asset(
                                                                "images/download_loading.json")))
                                                    : Image(
                                                        image: AssetImage(
                                                            "images/download.png"),
                                                        width: 30,
                                                        height: 30,
                                                        color: Colors.white,
                                                      )),
                                            Text("Download",
                                                style: GoogleFonts.nunito(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(Size(200, 50)),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)))),
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xff3290FE))),
                      onPressed: () async {
                        return showModalBottomSheet(
                            backgroundColor: Color(0xff1b2234),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            context: context,
                            builder: (context) {
                              return Container(
                                width: double.infinity,
                                height: 180,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 10),
                                      child: Text("Set Wallpaper",
                                          style: GoogleFonts.nunito(
                                              fontSize: 21,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10,top: 17),
                                      child: GestureDetector(
                                        onTap: ()async{
                                          try{
                                            String url =
                                                "${wallpaperController.imageTypelist.value[widget.index].image}";
                                            int location = WallpaperManager.HOME_SCREEN;
                                            WallpaperManager.getDesiredMinimumHeight();
                                            WallpaperManager.getDesiredMinimumWidth();
                                            var file = await DefaultCacheManager().getSingleFile(url);
                                            final bool result =
                                            await WallpaperManager.setWallpaperFromFile(
                                                file.path, location);
                                            print("1-----------------)${result}");

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(content: Container(
                                              child: Text("Successfully"),
                                            )));
                                          }on Exception catch(e){
                                            print("eeeeeeeeeeeeeeeeeeeee${e}");
                                          }
                                          Navigator.pop(context);
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.home_filled,
                                              size: 22,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 10,),
                                            Text("Home Screen",
                                                style: GoogleFonts.nunito(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10,top: 17),
                                      child: GestureDetector(
                                        onTap: ()async{
                                          try{
                                            String url =
                                                "${wallpaperController.imageTypelist.value[widget.index].image}";
                                            int location = WallpaperManager.LOCK_SCREEN;
                                            WallpaperManager.getDesiredMinimumHeight();
                                            WallpaperManager.getDesiredMinimumWidth();
                                            var file = await DefaultCacheManager().getSingleFile(url);
                                            final bool result =
                                            await WallpaperManager.setWallpaperFromFile(
                                                file.path, location);
                                            print("1-----------------)${result}");

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(content: Container(
                                              child: Text("Successfully"),
                                            )));
                                          }on Exception catch(e){
                                            print("eeeeeeeeeeeeeeeeeeeee${e}");
                                          }
                                          Navigator.pop(context);
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.lock,
                                              size: 22,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 10,),
                                            Text("Lock Screen",
                                                style: GoogleFonts.nunito(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10,top: 17),
                                      child: GestureDetector(
                                        onTap: ()async{
                                          try{
                                            String url =
                                                "${wallpaperController.imageTypelist.value[widget.index].image}";
                                            int location = WallpaperManager.BOTH_SCREEN;
                                            WallpaperManager.getDesiredMinimumHeight();
                                            WallpaperManager.getDesiredMinimumWidth();
                                            var file = await DefaultCacheManager().getSingleFile(url);
                                            final bool result =
                                            await WallpaperManager.setWallpaperFromFile(
                                                file.path, location);
                                            print("1-----------------)${result}");

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(content: Container(
                                              child: Text("Successfully"),
                                            )));
                                          }on Exception catch(e){
                                            print("eeeeeeeeeeeeeeeeeeeee${e}");
                                          }
                                          Navigator.pop(context);
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.phone_android,
                                              size: 22,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 10,),
                                            Text("Home Screen & Lock Screen",
                                                style: GoogleFonts.nunito(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });

                      },
                      child: Text("Apply",
                          style: GoogleFonts.nunito(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void downloadAndStoreImage() async {
    if (wallpaperController.imageTypelist.value.length > widget.index && widget.index < wallpaperController.imageTypelist.length) {
      String imageUrl =
          "${wallpaperController.imageTypelist.value[widget.index].image}";
      try {
        setState(() {

          wallpaperController.isdownloading.value = true;
          print("---11----)${  wallpaperController.isdownloading.value}");
        });
        Future.delayed(
          Duration(seconds: 5),
          () async {
            setState(() {
              wallpaperController.isdownloading.value = false;
              print("---22----)${  wallpaperController.isdownloading.value}");
            });
            Dio dio = Dio();
            Directory? directory = await getExternalStorageDirectory();
            fileName = 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
            savePath = directory!.path + '/' + "${fileName}";
            //String savePath ='';
            print(directory);
            await dio.download(imageUrl, savePath);
            print('========Download Image');

            for (int i = 0; i < wallpaperController.downloadlist.value.length; i++) {
              if (wallpaperController.imageTypelist.value[widget.index].id ==
                  wallpaperController.downloadlist.value[i].id) {
                wallpaperController.downloadlist.value.remove(
                    wallpaperController.imageTypelist.value[widget.index]);
              }
            }
            if (!wallpaperController.isdownloading.value) {
              wallpaperController.downloadlist.value
                  .add(wallpaperController.imageTypelist.value[widget.index]);
            }

            Get.to(() => DownloadSuccess());
          },
        );
      } catch (error) {
        print('========download Failed Error: $error');
        Get.to(() => DownloadFailed());
      }
    }
  }
}
