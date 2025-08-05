import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/DrawerScreen/DrawerScreen.dart';
import 'package:wallpaper/ThemeModel.dart';


class EdgeLighting extends StatefulWidget {
  const EdgeLighting({Key? key}) : super(key: key);

  @override
  State<EdgeLighting> createState() => _EdgeLightingState();
}

class _EdgeLightingState extends State<EdgeLighting> {
  Icon searchimage = Icon(Icons.search);
  Widget searchtitle =
  Text("3D Wallpaper", style: TextStyle(color: Colors.white));
  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(context);
    return Scaffold(
      backgroundColor:!darkModeProvider.isDarkMode? Color(0xff1b2234):Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:!darkModeProvider.isDarkMode? Color(0xff1b2234):Colors.white,
        leading:Builder(builder: (context) {
          return  Padding(
            padding: const EdgeInsets.all(12),
            child: GestureDetector(
              onTap: (){
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
                image: AssetImage("images/menubar.png"),
              ),
            ),
          );
        },),

        title: searchtitle,
        actions: <Widget>[
          IconButton(
              iconSize: 25,
              onPressed: () {
                setState(() {
                  if (this.searchimage.icon == Icons.search) {

                    this.searchimage = new Icon(Icons.cancel_outlined);
                    this.searchtitle = new TextField(
                      //controller: textcontroller,
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
        ],
      ),
      body: Center(child: Text("EdgeLighting")),
    );
  }
}
