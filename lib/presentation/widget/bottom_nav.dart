
import 'package:flutter/material.dart';
import 'package:monipointproject/core/theme.dart';
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
            decoration:   BoxDecoration(color: Colors.black.withOpacity(0.75),borderRadius: BorderRadius.all(Radius.circular(32))
            ),
            child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              BottomNavWidget(
                onTap: () {
                  value.pageIndex = 1;
                },
               
                icons: value.pageIndex == 1
                    ? "searchicon.svg"
                    : "searchicon.svg",
                iconColor:  Colors.white,
                color: value.pageIndex == 1
                   ? AppColors.bottomBarActiveColor
                    :AppColors.secondaryColor
               
              ),
               BottomNavWidget(
                onTap: () {
                  value.pageIndex = 2;
                },
               
                icons:  "messageicon.svg",
                   
                color: value.pageIndex == 2
                ? AppColors.bottomBarActiveColor
                    :AppColors.secondaryColor
               
              ),
          
               BottomNavWidget(
                onTap: () {
                  value.pageIndex = 0;
                },
               
                icons:  "homeicon.svg",
                color: value.pageIndex == 0
                   ? AppColors.bottomBarActiveColor
                    :AppColors.secondaryColor
               
              ),
               BottomNavWidget(
                onTap: () {
                  value.pageIndex = 3;
                },
               
                icons:  "hearticon.svg",
                color: value.pageIndex == 3
                 ? AppColors.bottomBarActiveColor
                    :AppColors.secondaryColor
               
              ),
                BottomNavWidget(
                onTap: () {
                  value.pageIndex = 4;
                },
               
                icons:"profileicon.svg",
                color: value.pageIndex == 4
                   ? AppColors.bottomBarActiveColor
                    :AppColors.secondaryColor
               
              ),
            ]),
          ));
    }));
  }
}
