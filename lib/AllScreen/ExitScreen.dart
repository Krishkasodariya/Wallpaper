import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExitScreen extends StatefulWidget {
  const ExitScreen({Key? key}) : super(key: key);

  @override
  State<ExitScreen> createState() => _ExitScreenState();
}

class _ExitScreenState extends State<ExitScreen> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Color(0xff474F65),
        insetPadding: EdgeInsets.only(left: 15, right: 15),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Container(
          width: double.infinity,
          height: 390,
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
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Image(
                      image: AssetImage("images/close.png"),
                      width: 25,
                      height: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Text("Exit App?",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 25,
                  )),
              SizedBox(
                height: 8,
              ),
              Text("Are you sure You Want to exit?",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff7B89AE),
                    fontSize: 18,
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
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          side: MaterialStatePropertyAll(
                              BorderSide(color: Color(0xff68728D), width: 1)),
                          minimumSize: MaterialStatePropertyAll(Size(0, 50)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)))),
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xff474F65)),
                          elevation: MaterialStatePropertyAll(0),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text("No",
                            style: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff68728D))),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            minimumSize: MaterialStatePropertyAll(Size(0, 50)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)))),
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xff3290FE)),
                            elevation: MaterialStatePropertyAll(0)),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text("Yes",
                            style: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      ),
                    )
                  ],
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
