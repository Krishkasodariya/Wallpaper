
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/Controller/WallpaperController.dart';
import 'package:wallpaper/DrawerScreen/DrawerScreen.dart';
import 'package:wallpaper/ThemeModel.dart';

class LiveWallpaper extends StatefulWidget {
  const LiveWallpaper({Key? key}) : super(key: key);

  @override
  State<LiveWallpaper> createState() => _LiveWallpaperState();
}

class _LiveWallpaperState extends State<LiveWallpaper> {
  WallpaperController wallpaperController = Get.find();
  Uri? imageUri;
  int liveindex = 0;
  Icon searchimage = Icon(Icons.search);
  Widget searchtitle =
      Text("Live Wallpaper", style: TextStyle(color: Colors.white));

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor:
              !darkModeProvider.isDarkMode ? Color(0xff1b2234) : Colors.white,
          leading: Builder(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.leftToRight,
                          child: DrawerScreen(),
                        ),
                      );
                    });
                  },
                  child: Image(
                    image: AssetImage("images/lightmenubar.png"),
                  ),
                ),
              );
            },
          ),
          title: Text("Live Wallpaper",
              style: TextStyle(
                color:
                    !darkModeProvider.isDarkMode ? Colors.white : Colors.black,
              )),
          /* actions: <Widget>[
              IconButton(
                iconSize: 25,
                  onPressed: () {
                    setState(() {
                      if (this.searchimage.icon == Icons.search) {

                        this.searchimage = new Icon(Icons.cancel_outlined);
                        this.searchtitle = new TextField(
                         // controller: textcontroller,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              hintText: "Search",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                        );
                      } else {

                        this.searchimage = new Icon(Icons.search);
                        this.searchtitle = new Text("3D Wallpaper",
                            style: TextStyle(color: Colors.white));
                      }
                    });
                  },
                  icon: searchimage),
            ],*/
        ),
        backgroundColor:
            !darkModeProvider.isDarkMode ? Color(0xff1b2234) : Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                        width: double.infinity,
                        child: wallpaperController
                                .videoTypelist.value.isNotEmpty
                            ? GridView.builder(
                                padding: EdgeInsets.only(bottom: 100),
                                addAutomaticKeepAlives: true,
                                addRepaintBoundaries: true,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: wallpaperController
                                    .videoTypelist.value.length,
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
                                    child: GestureDetector(
                                      onTap: () {
                                        convertAssetToUri(index);
                                      },
                                      child: Container(
                                        child: Stack(
                                          children: [
                                            Container(
                                                width: double.infinity,
                                                height: 280,
                                                child: Image(
                                                  image: NetworkImage(
                                                      "${wallpaperController.videoTypelist.value[index].thumbnail}"),
                                                  fit: BoxFit.cover,
                                                )),

                                            // Text(
                                            //     "${wallpaperController.videoTypelist.value[index].id}",style: TextStyle(color: Colors.white,fontSize: 20)),
                                            /* Align(
                                      alignment: Alignment.topRight,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              foundimage[index].Like =
                                              !foundimage[index]
                                                  .Like;
                                            });

                                            if (foundimage[index]
                                                .Like) {
                                              wallpaperController
                                                  .favouritelist.value
                                                  .add(foundimage[
                                              index]);
                                              print(
                                                  wallpaperController
                                                      .favouritelist
                                                      .value);
                                            } else {
                                              for (int i = 0;
                                              i <
                                                  wallpaperController
                                                      .favouritelist
                                                      .value
                                                      .length;
                                              i++) {
                                                if (foundimage[index]
                                                    .id ==
                                                    wallpaperController
                                                        .favouritelist
                                                        .value[i]
                                                        .id) {
                                                  wallpaperController
                                                      .favouritelist
                                                      .value
                                                      .remove(
                                                      foundimage[
                                                      index]);
                                                }
                                              }
                                            }
                                          },
                                          child: foundimage[index]
                                              .Like
                                              ? Padding(
                                            padding:
                                            const EdgeInsets
                                                .only(
                                                right: 20,
                                                top: 20),
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape
                                                      .circle,
                                                  color: Colors
                                                      .white24),
                                              child: Center(
                                                child: Image(
                                                  image: AssetImage(
                                                      "images/fill_like.png"),
                                                  width: 28,
                                                  height: 28,
                                                ),
                                              ),
                                            ),
                                          )
                                              : Padding(
                                            padding:
                                            const EdgeInsets
                                                .only(
                                                right: 20,
                                                top: 20),
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape
                                                      .circle,
                                                  color: Colors
                                                      .white24),
                                              child: Center(
                                                child: Image(
                                                  image: AssetImage(
                                                      "images/empty_like.png"),
                                                  width: 28,
                                                  height: 28,
                                                ),
                                              ),
                                            ),
                                          )),
                                    )*/
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height/2,
                                child: Center(
                                  child: Lottie.asset("images/Progress.json",
                                      width: 40, height: 40),
                                ))))
              ],
            ),
          ),
        ));
  }

/*  Future<String> getFilePathFromAsset(String assetImagePath) async {
    final Directory? tempDir = await getExternalStorageDirectory();
    final File tempFile =
        File('${tempDir!.path}/${assetImagePath.split('/').last}');
    final ByteData byteData = await rootBundle.load(assetImagePath);
    await tempFile.writeAsBytes(byteData.buffer.asUint8List(), flush: true);
    return tempFile.path;
  }*/

  // String changeVideoExtension(String videoPath, String newExtension) {
  //   String extension = path.extension(videoPath);
  //   print("extension======)${extension}");
  //   String videoName = path.basenameWithoutExtension(videoPath);
  //   print("videoName======)${videoName}");
  //   String newPath = path.join(path.dirname(videoPath), '$videoName.$newExtension');
  //   print("newPath======)${newPath}");
  //
  //   return newPath;
  // }

  void convertAssetToUri(int index) async {
    String result;
    try {
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      print("a=======)${wallpaperController.videoTypelist.value[index].original}");
      var file = await DefaultCacheManager().getSingleFile("${wallpaperController.videoTypelist.value[index].original}");
      print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
      result = await AsyncWallpaper.setLiveWallpaper(
        filePath: file.path,
        goToHome: true,
        // toastDetails: ToastDetails.success(),
        // errorToastDetails: ToastDetails.error(),
      )
          ? 'oooooooooooooooooooooooooookkkkkkkkkk'
          : 'fffffffffffffffffffffffffffffffffffff';
      print("cccccccccccccccccccccccccccccccc");
    } on PlatformException {
      result = 'fffffffffffffffffffffffffffffffffffff';
      print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
    }
  }
}
