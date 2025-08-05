import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/Controller/WallpaperController.dart';
import 'package:wallpaper/ThemeModel.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {

  WallpaperController wallpaperController = Get.find();
  final cacheManager = CacheManager(Config("cacheKey",
      stalePeriod: Duration(days: 15), maxNrOfCacheObjects: 100));

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor:!darkModeProvider.isDarkMode? Color(0xff1b2234):Colors.white,
        body: SingleChildScrollView(
          child: Container(
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
                            Get.back();
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
                          "My Download",
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
                  height: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      child: wallpaperController.downloadlist.isNotEmpty
                          ? GridView.builder(
                        padding: EdgeInsets.only(bottom: 100),
                              itemCount:
                                  wallpaperController.downloadlist.value.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisExtent: 280,
                                      mainAxisSpacing: 15,
                                      crossAxisSpacing: 15),
                              itemBuilder: (context, index) {
                                return ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 280,
                                        child: CachedNetworkImage(
                                          cacheManager: cacheManager,
                                          key: UniqueKey(),
                                          imageUrl:
                                              "${wallpaperController.downloadlist.value[index].image}",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                for(int i=0;i<wallpaperController.downloadlist.value.length;i++){
                                                  print("aaa");
                                                  if(wallpaperController.downloadlist.value[index]==wallpaperController.downloadlist.value[i]){
                                                    print("ssss");
                                                    wallpaperController.downloadlist.value.remove(wallpaperController.downloadlist.value[index]);
                                                  }
                                                }
                                              });
                                            },
                                            child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20, top: 20),
                                                    child: Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color:
                                                              Colors.white24),
                                                      child: Center(
                                                        child: Image(
                                                          image: AssetImage(
                                                              "images/delete.png"),
                                                          width: 40,
                                                          height: 40,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.only(bottom: 10),
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                minimumSize: MaterialStatePropertyAll(Size(100, 40)),
                                                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.all(Radius.circular(25)))),
                                                backgroundColor:!darkModeProvider.isDarkMode?
                                                MaterialStatePropertyAll(Color(0xffffffff)):MaterialStatePropertyAll(Color(0xff3290FE))),
                                            onPressed: () async{
                                              String url ="${wallpaperController.downloadlist.value[index].image}";
                                              int location = WallpaperManager.BOTH_SCREEN;
                                              WallpaperManager.getDesiredMinimumHeight();
                                              WallpaperManager.getDesiredMinimumWidth();
                                              var file = await DefaultCacheManager().getSingleFile(url);
                                              final bool result = await WallpaperManager.setWallpaperFromFile(file.path, location);
                                              print(result);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(content: Container(
                                                child: Text("Successfully"),
                                              )));
                                            },
                                            child: Text("Apply",
                                                style: GoogleFonts.nunito(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: !darkModeProvider.isDarkMode?Colors.black:Colors.white,)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          : Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Container(
                                width: 230,
                                height: 230,
                                child: Lottie.asset("images/empty_search.json",
                                    width: 230, height: 230),
                              ),
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
