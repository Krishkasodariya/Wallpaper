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

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  WallpaperController wallpaperController = Get.find();
  int favouriteindex=0;
  final cacheManager=CacheManager(Config("cacheKey",stalePeriod: Duration(days: 15),maxNrOfCacheObjects: 100));

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
                          child:!darkModeProvider.isDarkMode?Image(
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
                          "Favourite",
                          style: TextStyle(
                              color:  !darkModeProvider.isDarkMode?Colors.white:Colors.black,
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
                      child: wallpaperController.favouritelist.isNotEmpty
                          ? GridView.builder(
                        padding: EdgeInsets.only(bottom: 100),
                              itemCount: wallpaperController
                                  .favouritelist.value.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisExtent: 280,
                                      mainAxisSpacing: 15,
                                      crossAxisSpacing: 15),
                              itemBuilder: (context, index) {
                               // favouriteindex=index;
                                return ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 280,
                                        child:CachedNetworkImage(
                                          cacheManager: cacheManager,
                                          key: UniqueKey(),
                                          imageUrl: "${wallpaperController.favouritelist.value[index].image}",    fit: BoxFit.cover,),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                wallpaperController.favouritelist.value[index].Like =
                                                    !wallpaperController
                                                        .favouritelist
                                                        .value[index]
                                                        .Like!;
                                              });

                                                for (int i = 0; i < wallpaperController.favouritelist.length; i++){
                                                  if (!wallpaperController.favouritelist.value[i].Like!) {
                                                    setState(() {
                                                      wallpaperController.favouritelist.remove(wallpaperController.favouritelist[index]);
                                                    });

                                                  }
                                                }

                                            },
                                            child: !wallpaperController
                                                    .favouritelist
                                                    .value[index]
                                                    .Like!
                                                ? Padding(
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
                                                              "images/empty_like.png"),
                                                          width: 28,
                                                          height: 28,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Padding(
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
                                                              "images/fill_like.png"),
                                                          width: 28,
                                                          height: 28,
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
                                                                      "${wallpaperController.favouritelist.value[index].image}";
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
                                                                      "${wallpaperController.favouritelist.value[index].image}";
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
                                                                      "${wallpaperController.favouritelist.value[index].image}";
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
                            width: 230, height: 230,
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
