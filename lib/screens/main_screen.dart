import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //search controller
  final TextEditingController _searchController = TextEditingController();

  //Bottom Sheet for for Langauge Filter
  Future _showLanguageBottomSheet() async {
    return showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFFFFFFFF),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) {
        return Container(
          margin: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Languages',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: const BoxDecoration(
                          color: Color(0xff98A2B3),
                          borderRadius: BorderRadius.all(Radius.circular(2))),
                      child: const Icon(Icons.close),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  //Bottom Sheet for for Continent Filter
  Future _showContinentBottomSheet() async {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.all(24),
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Continent',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: const BoxDecoration(
                          color: Color(0xff98A2B3),
                          borderRadius: BorderRadius.all(Radius.circular(2))),
                      child: const Icon(Icons.close),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.only(left: 24.w, right: 24.w, top: 0.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //logo
                    SizedBox(
                      height: 25.h,
                      width: 120.h,
                      child: Image.asset(
                        'assets/images/ex_logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    //theme switcher
                    GestureDetector(
                      child: const Icon(Icons.dark_mode),
                    )
                  ],
                ),
                SizedBox(height: 20.h),
                //searchbar
                SearchBar(
                  controller: _searchController,
                  hintText: 'Search Country',
                  focusNode: FocusNode(canRequestFocus: false),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(fontFamily: 'Axiforma'),
                  ),
                  leading: const Icon(Icons.search),
                  elevation: MaterialStateProperty.all(2),
                  //backgroundColor: MaterialStateProperty.all(Color(0x00f2f4f7)),
                  shape: MaterialStateProperty.all(
                    const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Filter by Language...modal button
                      GestureDetector(
                        onTap: () {
                          //show modal
                          print("languages modal");
                          _showLanguageBottomSheet();
                        },
                        child: Container(
                          height: 40.h,
                          width: 73.w,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFCFCFD),
                              borderRadius: BorderRadius.circular(4.r),
                              border: Border.all(
                                color: const Color(0xFFA9B8D5),
                                width: 0.2,
                              )),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  CupertinoIcons.globe,
                                  size: 25.h,
                                ),
                                Text(
                                  "EN",
                                  style: TextStyle(fontSize: 14.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      //Filter by Continent...modal button
                      GestureDetector(
                        onTap: () {
                          //show modal
                          print("continent modal");
                          _showContinentBottomSheet();
                        },
                        child: Container(
                          height: 40.h,
                          width: 86.w,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFCFCFD),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                width: 0.2,
                                color: const Color(0xFFA9B8D5),
                              )),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.filter_alt_outlined,
                                  size: 25.h,
                                ),
                                Text(
                                  "Filter",
                                  style: TextStyle(fontSize: 14.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
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
