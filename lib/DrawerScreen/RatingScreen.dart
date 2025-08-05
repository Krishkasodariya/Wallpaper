import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  var ratingindex = 0.0;

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
              boxShadow: [BoxShadow(color: Color(0xffB8CFEA), blurRadius: 10)]),
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
              Center(
                  child: Image(
                image: AssetImage("images/star.png"),
                width: 100,
                height: 100,
              )),
              SizedBox(
                height: 20,
              ),
              Text("Rate This App",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 22,
                  )),
              SizedBox(
                height: 8,
              ),
              Text("Tap a star to give your rating.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff7B89AE),
                    fontSize: 18,
                  )),
              SizedBox(
                height: 25,
              ),
              RatingBar.builder(
                  glow: false,
                  minRating: 1,
                  updateOnDrag: true,
                  itemSize: 50,
                  initialRating: ratingindex,
                  unratedColor: Color(0xff68728D),
                  itemBuilder: (context, index) {
                    return Icon(Icons.star_rounded, color: Color(0xffFFD93B));
                  },
                  onRatingUpdate: (value) {
                    setState(() {
                      ratingindex = value;
                      print(ratingindex);
                    });
                  }),
              SizedBox(
                height: 20,
              ),
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
                          Navigator.pop(context);
                        },
                        child: Text("Later",
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
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Rating - ${ratingindex}")));
                          Navigator.pop(context);
                        },
                        child: Text("Rate Now",
                            style: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
