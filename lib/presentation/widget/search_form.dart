
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monipointproject/core/theme.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.7,
      child: TextFormField(
       initialValue:  'Saint Petersburg',
        style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w500,color: AppColors.secondaryColor.withOpacity(0.8),fontSize: 13.0.sp),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 10.w),
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w500,color: const Color(0xffC0C0C0),fontSize: 18.0.sp),
          fillColor: Colors.grey[200],
          filled: true,
          isDense: true,
          
          prefixIconConstraints:const BoxConstraints(maxHeight: 100, maxWidth: 100),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              "assets/svgs/searchbar.svg",
            color: AppColors.secondaryColor.withOpacity(0.8),
            height:18 ,
            width: 18,
              //size: 50,
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32),borderSide: BorderSide.none,),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32),borderSide: BorderSide.none,),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32),borderSide: BorderSide.none,),
        ),
        onChanged: (value) {
          // snapshotCache.searchProductFromList(value);
        },
      ),
    ).animate().fadeIn(delay:500.ms).moveX();
  }
}