import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wallpaper/Controller/WallpaperController.dart';

class InternetScreen extends StatefulWidget {
  const InternetScreen({Key? key}) : super(key: key);

  @override
  State<InternetScreen> createState() => _InternetScreenState();
}

class _InternetScreenState extends State<InternetScreen> {
  WallpaperController wallpaperController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Color(0xff474F65),
        insetPadding: EdgeInsets.only(left: 15, right: 15),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Container(
          width: double.infinity,
          height: 430,
          decoration: BoxDecoration(
            color: Color(0xff474F65),
            border: Border.all(color: Color(0xff7F8BAB), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Spacer(),
                  Center(
                      child: Image(
                        image: AssetImage("images/internet.png"),
                        width: 120,
                        height: 120,
                      )),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: Align(
                        child: Image(
                          image: AssetImage("images/close.png"),
                          width: 25,
                          height: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text("No Network Available",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 25,
                  )),
              SizedBox(
                height: 8,
              ),
              Text("No internet connection found. Check \n                  your connection",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff7B89AE),
                    fontSize: 16,
                  )),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff474F65),
                      border: Border.all(color: Color(0xff7F8BAB), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Center(
                      child: Text("AD SPACE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStatePropertyAll(Size(150, 50)),
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)))),
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xff3290FE)),
                        elevation: MaterialStatePropertyAll(0)),
                    onPressed: ()async{
                      wallpaperController.isdeviceconnected.value=await InternetConnectionChecker().hasConnection;
                      Navigator.of(context).pop(true);
                      setState(() {
                        wallpaperController.isalertset.value=false;
                      });
                      if(!wallpaperController.isdeviceconnected.value){
                        showDialog(context: context, builder: (context) {
                          return InternetScreen();
                        },);
                        setState(() {
                          wallpaperController.isalertset.value=true;
                        });
                      }
                    },
                    child: Text("Refresh",
                        style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ));
  }
}
