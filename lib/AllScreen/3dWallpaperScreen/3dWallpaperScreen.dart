import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallpaper/AllScreen/3dWallpaperScreen/ViewOnScreen.dart';
import 'package:wallpaper/AllScreen/InternetScreen.dart';
import 'package:wallpaper/Controller/WallpaperController.dart';
import 'package:wallpaper/DrawerScreen/DrawerScreen.dart';
import 'package:wallpaper/ModelClass/ImageModel.dart';
import 'package:wallpaper/ModelClass/ImageSliderModel.dart';
import 'package:wallpaper/ModelClass/LiveImageModel.dart';
import 'package:wallpaper/ThemeModel.dart';

class ThreedWallpaper extends StatefulWidget {
  const ThreedWallpaper({Key? key}) : super(key: key);

  @override
  State<ThreedWallpaper> createState() => _ThreedWallpaperState();
}

class _ThreedWallpaperState extends State<ThreedWallpaper>
    with AutomaticKeepAliveClientMixin {
  WallpaperController wallpaperController = Get.find();
  final cacheManager = CacheManager(Config("cacheKey",
      stalePeriod: Duration(days: 15), maxNrOfCacheObjects: 100));
  bool onClik = false;
  var textcontroller = TextEditingController();
  int dotindex = 0;
  FocusNode myfocus=FocusNode();

  List<ImageModel> currentdata = [];

  List<ImageSliderModel> imagesliderlist = [
    ImageSliderModel(
        name: "Cool", image: "images/i1.jpg", subname: "Wallpaper"),
    ImageSliderModel(
        name: "Cool", image: "images/i2.jpg", subname: "Wallpaper"),
    ImageSliderModel(
        name: "Cool", image: "images/i3.jpg", subname: "Wallpaper"),
    ImageSliderModel(
        name: "Cool", image: "images/i4.jpg", subname: "Wallpaper"),
    ImageSliderModel(
        name: "Cool", image: "images/i5.jpg", subname: "Wallpaper"),
  ];

  Icon darksearchimage = Icon(Icons.search);
  Icon searchimage = Icon(
    Icons.search,
    color: Colors.black,
  );
  Widget darksearchtitle = Text("3D Wallpaper", style: TextStyle(color: Colors.white));
  Widget searchtitle = Text("3D Wallpaper", style: TextStyle(color: Colors.black));

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(context);
    return SafeArea(
      child: Scaffold(
          appBar: !darkModeProvider.isDarkMode
              ? AppBar(
                  elevation: 0,
                  backgroundColor: Color(0xff1b2234),
                  leading: Builder(
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: GestureDetector(
                          onTap: () {
                            myfocus.unfocus();
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.leftToRight,
                                child: DrawerScreen(),
                              ),
                            );
                          },
                          child: Image(
                            image: AssetImage("images/menubar.png"),
                          ),
                        ),
                      );
                    },
                  ),
                  title: darksearchtitle,
                  actions: <Widget>[
                    IconButton(
                        iconSize: 25,
                        onPressed: () {
                          setState(() {
                            if (this.darksearchimage.icon == Icons.search) {

                              textcontroller.clear();
                              this.darksearchimage =
                                  new Icon(Icons.cancel_outlined);
                              this.darksearchtitle = new TextField(
                                onChanged: (value) {
                                  search(value);
                                  searchCategories(value);
                                },
                                focusNode: myfocus,
                                controller: textcontroller,
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
                              wallpaperController.getdata();
                              this.darksearchimage = new Icon(Icons.search);
                              this.darksearchtitle = new Text("3D Wallpaper",
                                  style: TextStyle(color: Colors.white));
                            }
                          });
                        },
                        icon: darksearchimage),
                  ],
                )
              : AppBar(
                  elevation: 0,
                  backgroundColor: Color(0xffffffff),
                  leading: Builder(
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: GestureDetector(
                          onTap: () {
                            myfocus.unfocus();
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.leftToRight,
                                child: DrawerScreen(),
                              ),
                            );
                          },
                          child: Image(
                            image: AssetImage("images/lightmenubar.png"),
                          ),
                        ),
                      );
                    },
                  ),
                  title: searchtitle,
                  actions: <Widget>[
                    IconButton(
                        iconSize: 25,
                        onPressed: () {
                          setState(() {
                            if (this.searchimage.icon == Icons.search) {
                              textcontroller.clear();
                              this.searchimage = new Icon(Icons.cancel_outlined,color: Colors.black,);
                              this.searchtitle = new TextField(
                                onChanged: (value) {
                                  search(value);
                                  searchCategories(value);
                                },
                                focusNode: myfocus,
                                controller: textcontroller,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                maxLines: 1,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    hintText: "Search",
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500)),
                              );
                            } else {

                              wallpaperController.getdata();
                              this.searchimage = new Icon(Icons.search,color: Colors.black,);
                              this.searchtitle = new Text("3D Wallpaper",
                                  style: TextStyle(color: Colors.black));
                            }
                          });
                        },
                        icon: searchimage),
                  ],
                ),
          backgroundColor: !darkModeProvider.isDarkMode ? Color(0xff1b2234) : Colors.white,
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Container(
                        height: 180,
                        child: Stack(
                          children: [
                            CarouselSlider.builder(
                                itemCount: imagesliderlist.length,
                                itemBuilder: (context, index, realIndex) {
                                  return Container(
                                    width: double.infinity,
                                    height: 180,
                                    color: Colors.white70,
                                    child: Image(
                                      image: AssetImage(
                                          imagesliderlist[index].image),
                                      width: double.infinity,
                                      height: 180,
                                      fit: BoxFit.fill,
                                    ),
                                  );
                                },
                                options: CarouselOptions(
                                  height: 180,
                                  viewportFraction: 1.0,
                                  autoPlay: true,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      dotindex = index;
                                    });
                                  },
                                )),
                            Center(
                              child: Container(
                                child: Column(
                                  children: [
                                    Spacer(),
                                    Text(imagesliderlist[dotindex].name,
                                        style: GoogleFonts.parisienne(
                                            fontSize: 50,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Text(
                                          imagesliderlist[dotindex].subname,
                                          style: TextStyle(
                                              fontSize: 40,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: AnimatedSmoothIndicator(
                                  activeIndex: dotindex,
                                  count: imagesliderlist.length,
                                  effect: JumpingDotEffect(
                                    activeDotColor: Colors.white,
                                    dotWidth: 10,
                                    dotHeight: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: wallpaperController.FoundCategoriesList.length,
                        itemBuilder: (context, index) {

                          return GestureDetector(
                            onTap: () async {
                              setState(() {
                                wallpaperController.tabindex.value=wallpaperController.FoundCategoriesList[index].id!;
                                print("index==============)${index}");
                                print("FoundCategoriesList=============)${wallpaperController.FoundCategoriesList[index].id}");
                              });
                              await wallpaperController.getdata();
                              for (int i = 0; i < wallpaperController.favouritelist.length; i++) {
                                if (wallpaperController.favouritelist.value[i].Like!) {
                                  for (int j = 0; j < wallpaperController.foundimage.length; j++) {
                                    if (wallpaperController.favouritelist.value[i].id ==wallpaperController.foundimage.value[j].id) {
                                      setState(() {
                                        wallpaperController.foundimage.value[j].Like = true;
                                      });
                                    }
                                  }
                                }
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: !darkModeProvider.isDarkMode
                                  ? BoxDecoration(
                                      color: wallpaperController.tabindex.value == wallpaperController.FoundCategoriesList[index].id!
                                              ? Color(0xff3290FE)
                                              : Color(0xff343B4E),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)))
                                  : BoxDecoration(
                                      color:
                                          wallpaperController.tabindex.value == wallpaperController.FoundCategoriesList[index].id!
                                              ? Color(0xff3290FE)
                                              : Color(0xffeeeeee),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Center(
                                  child: Text(
                                      "${wallpaperController.FoundCategoriesList[index].title}",
                                      style: GoogleFonts.nunito(
                                          fontSize: 18,
                                          color: wallpaperController.tabindex.value ==
                                              wallpaperController.FoundCategoriesList[index].id!
                                              ? Colors.white
                                              : Color(0xff6f7180))),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                        width: double.infinity,
                        child: textcontroller.text.isEmpty
                            ? wallpaperController.foundimage.isNotEmpty
                                ? GridView.builder(
                                    padding: EdgeInsets.only(bottom: 100),
                                    addAutomaticKeepAlives: true,
                                    addRepaintBoundaries: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: wallpaperController
                                        .foundimage.value.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisExtent: 280,
                                            mainAxisSpacing: 15,
                                            crossAxisSpacing: 15),
                                    itemBuilder: (context, index) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(() => ViewOnScreen(
                                                  index: index,
                                              name:"${wallpaperController.foundimage.value[index].title}",
                                              image:"${wallpaperController.foundimage.value[index].image}" ,
                                                ));
                                          },
                                          child: Container(
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 280,
                                                  child: CachedNetworkImage(
                                                    cacheManager: cacheManager,
                                                    key: UniqueKey(),
                                                    imageUrl:
                                                        "${wallpaperController.foundimage.value[index].image}",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          wallpaperController.foundimage.value[index].Like = !wallpaperController.foundimage.value[index].Like!;
                                                        });

                                                        for (int a = 0; a < wallpaperController.foundimage.value.length; a++) {
                                                          if (!wallpaperController.foundimage[a].Like!) {
                                                            for (int b = 0; b < wallpaperController.favouritelist.value.length; b++) {
                                                              if (wallpaperController.foundimage.value[a].id == wallpaperController.favouritelist.value[b].id) {
                                                                setState(() {
                                                                  wallpaperController.favouritelist.value.remove(wallpaperController.favouritelist.value[b]);
                                                                });
                                                              }
                                                            }
                                                          }
                                                        }

                                                        if (wallpaperController.foundimage.value[index].Like!) {
                                                          wallpaperController.favouritelist.value.add(wallpaperController.foundimage.value[index]);
                                                        } else {
                                                          for (int i = 0; i < wallpaperController.favouritelist.value.length; i++) {
                                                            if (wallpaperController.foundimage.value[index].id ==
                                                                wallpaperController.favouritelist.value[i].id) {
                                                              setState(() {
                                                                wallpaperController.favouritelist.value.remove(wallpaperController.foundimage.value[index]);
                                                              });
                                                            }
                                                          }
                                                        }
                                                      },
                                                      child: wallpaperController
                                                              .foundimage
                                                              .value[index]
                                                              .Like!
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
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 170,
                                    child: Center(
                                      child: Lottie.asset(
                                          "images/Progress.json",
                                          width: 40,
                                          height: 40),
                                    ))
                            : wallpaperController.foundimage.isNotEmpty
                                ? GridView.builder(
                                    padding: EdgeInsets.only(bottom: 100),
                                    addAutomaticKeepAlives: true,
                                    addRepaintBoundaries: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: wallpaperController
                                        .foundimage.value.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisExtent: 280,
                                            mainAxisSpacing: 15,
                                            crossAxisSpacing: 15),
                                    itemBuilder: (context, index) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        child: GestureDetector(
                                          onTap: () {
                                            print("======)aqdwd---${index}");
                                            Get.to(() => ViewOnScreen(
                                                  index: index,
                                              name:"${wallpaperController.foundimage.value[index].title}",
                                              image:"${wallpaperController.foundimage.value[index].image}" ,
                                                ));
                                          },
                                          child: Container(
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 280,
                                                  child: CachedNetworkImage(
                                                    cacheManager: cacheManager,
                                                    key: UniqueKey(),
                                                    imageUrl:
                                                        "${wallpaperController.foundimage.value[index].image}",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        wallpaperController.likeindex.value = index;
                                                        setState((){
                                                          wallpaperController.foundimage.value[index].Like = !wallpaperController.foundimage.value[index].Like!;
                                                        });

                                                        for (int a = 0; a < wallpaperController.foundimage.value.length; a++){
                                                          if (!wallpaperController.foundimage[a].Like!) {
                                                            for (int b = 0; b < wallpaperController.favouritelist.value.length; b++) {
                                                              if (wallpaperController.foundimage.value[a].id == wallpaperController.favouritelist.value[b].id) {
                                                                setState(() {
                                                                  wallpaperController.favouritelist.value.remove(wallpaperController.favouritelist.value[b]);
                                                                });
                                                              }
                                                            }
                                                          }
                                                        }

                                                        if(wallpaperController.foundimage.value[index].Like!){
                                                          wallpaperController.favouritelist.value.add(wallpaperController.foundimage.value[index]);
                                                        } else {
                                                          for (int i = 0; i < wallpaperController.favouritelist.value.length; i++) {
                                                            if (wallpaperController.foundimage.value[index].id == wallpaperController.favouritelist.value[i].id) {
                                                              setState(() {
                                                                wallpaperController.favouritelist.value.remove(wallpaperController.foundimage.value[index]);
                                                              });
                                                            }
                                                          }
                                                        }


                                                      },
                                                      child: wallpaperController
                                                              .foundimage
                                                              .value[index]
                                                              .Like!
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
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 170,
                                    child: Center(
                                        child: Text("No Data Found",
                                            style: TextStyle(
                                                color:!darkModeProvider.isDarkMode? Colors.white:Colors.black,
                                                fontSize: 16))))),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void search(String value) {
    wallpaperController.result.value = wallpaperController.imageTypelist
        .where((element) =>
            element.title!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    setState(() {
      wallpaperController.foundimage.value = wallpaperController.result.value;
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void searchCategories(String value) {
    wallpaperController.ResultCategoriesList.value = wallpaperController.imagelist
        .where((p0) => p0.title!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    setState(() {
      wallpaperController.FoundCategoriesList.value = wallpaperController.ResultCategoriesList.value;
    });
  }
}
//https://jsonplaceholder.typicode.com/photos
//https://picsum.photos/v2/list?page=2&limit=100
//https://picsum.photos/v2/list
