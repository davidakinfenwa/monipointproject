
import 'package:flutter/material.dart';
import 'package:monipointproject/presentation/share/tabscreen_provider.dart';
import 'package:monipointproject/presentation/widget/bottomnav_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BottomMainNav extends StatelessWidget {
  const BottomMainNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TabScreenNotifier>(builder: ((context, value, child) {
      return SafeArea(
          child: Container(
            margin: const EdgeInsets.fromLTRB(30, 30, 30, 20),
            //height: 48.h,
            width: MediaQuery.sizeOf(context).width.w,
            padding: const EdgeInsets.symmetric( horizontal: 0,vertical: 4),
            decoration:  const BoxDecoration(color: Colors.black,borderRadius: BorderRadius.all(Radius.circular(32))
            ),
            child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              BottomNavWidget(
                onTap: () {
                  value.pageIndex = 1;
                },
               
                icons: value.pageIndex == 1
                    ? Icons.search_outlined
                    : Icons.search_rounded,
                color: value.pageIndex == 1
                    ? const Color(0xfffca717)
                    : Colors.transparent
               
              ),
               BottomNavWidget(
                onTap: () {
                  value.pageIndex = 2;
                },
               
                icons:  Icons.chat_bubble,
                   
                color: value.pageIndex == 2
                ? const Color(0xfffca717)
                    : Colors.transparent
               
              ),
          
               BottomNavWidget(
                onTap: () {
                  value.pageIndex = 0;
                },
               
                icons:  Icons.home_filled,
                color: value.pageIndex == 0
                   ? const Color(0xfffca717)
                    : Colors.transparent
               
              ),
               BottomNavWidget(
                onTap: () {
                  value.pageIndex = 3;
                },
               
                icons:  Icons.favorite,
                color: value.pageIndex == 3
                   ? const Color(0xfffca717)
                    : Colors.transparent
               
              ),
                BottomNavWidget(
                onTap: () {
                  value.pageIndex = 4;
                },
               
                icons: Icons.person_4_rounded,
                color: value.pageIndex == 4
                   ? const Color(0xfffca717)
                    : Colors.transparent
               
              ),
            ]),
          ));
    }));
  }
}
