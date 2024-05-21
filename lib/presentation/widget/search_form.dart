
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 20),
      width: MediaQuery.sizeOf(context).width * 0.7,
      height: 50.sp,
      child: TextFormField(
        // focusNode: _searchTextFieldFocusNode,
        // controller: _searchTextFieldController,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: const Color(0xffC0C0C0),
            fontSize: 13.0.sp),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: const Color(0xffC0C0C0),
              fontSize: 18.0.sp),
          fillColor: Colors.grey[200],
          filled: true,
          isDense: true,
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 100, maxWidth: 100),
          prefixIcon: Transform.scale(
              scale: .4,
              child: const Icon(
                Icons.search,
                size: 50,
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          // snapshotCache.searchProductFromList(value);
        },
      ),
    );
  }
}