import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({Key? key}) : super(key: key);

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class FilterTabModel {
  bool check;
  String name;

  FilterTabModel({required this.check, required this.name});
}

class _FilterDialogState extends State<FilterDialog> {
  var filtertabindex = 0;
  List<FilterTabModel> filtertablist = [
    FilterTabModel(
      check: true,
      name: "All",
    ),
    FilterTabModel(
      check: true,
      name: "3d",
    ),
    FilterTabModel(
      check: true,
      name: "Color",
    ),
    FilterTabModel(
      check: true,
      name: "Light",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.only(left: 10,right: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Container(
        height: 390,
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage("images/tune.png"),
                          width: 27,
                          height: 27,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Filter",
                            style: GoogleFonts.nunito(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Category",
                        style: GoogleFonts.nunito(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: filtertablist.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                filtertabindex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: filtertabindex == index
                                      ? Color(0xff3290FE)
                                      : Color(0xffF5F5F5),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30, right: 30),
                                child: Center(
                                  child: Text(filtertablist[index].name,
                                      style: GoogleFonts.nunito(
                                          fontSize: 18,
                                          color: filtertabindex == index
                                              ? Colors.white
                                              : Color(0xff737683))),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Text("Newest",
                            style: GoogleFonts.nunito(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                        Spacer(),
                        Image(
                          image: AssetImage("images/forward_arrow.png"),
                          width: 17,
                          height: 17,
                          color: Color(0xffAFAFAF),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Text("Most Popular",
                            style: GoogleFonts.nunito(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                        Spacer(),
                        Image(
                          image: AssetImage("images/forward_arrow.png"),
                          width: 17,
                          height: 17,
                          color: Color(0xffAFAFAF),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Text("A to Z",
                            style: GoogleFonts.nunito(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                        Spacer(),
                        Image(
                          image: AssetImage("images/forward_arrow.png"),
                          width: 17,
                          height: 17,
                          color: Color(0xffAFAFAF),
                        )
                      ],
                    ),
                  ),
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
                              style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(0, 50)),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(25)) )),
                              backgroundColor: MaterialStatePropertyAll(Color(0xffF5F5F5))),
                              onPressed: () {}, child: Text("Reset",
                              style: GoogleFonts.nunito(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff737683))),),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          flex: 1,
                          child:  ElevatedButton(
                            style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(0, 50)),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(25)) )),
                                backgroundColor: MaterialStatePropertyAll(Color(0xff3290FE))),
                            onPressed: () {}, child: Text("Apply",
                              style: GoogleFonts.nunito(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),

      ),

    );
  }
}
