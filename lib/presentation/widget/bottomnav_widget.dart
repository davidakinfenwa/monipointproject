import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget(
      {super.key,
      this.onTap,
      required this.icons,
      required this.color,
      this.height,
      this.width,
      this.iconColor,
      this.iconSize});
  final void Function()? onTap;
  final IconData icons;

  final Color color;
  final double? width, height;
  final double? iconSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: 2,
      borderRadius: BorderRadius.all(Radius.circular(32.r)),
      // borderRadius: BorderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        splashColor: Colors.transparent, // Set the splash color to transparent
        splashFactory:
            InkRipple.splashFactory, // Use the default splash factory

        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Container(
           height: 50,
           width: 50,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              //shape: BoxShape.circle,
              //color: CustomTypography.kTransparentColor,
             borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
            child: Center(
              child: Icon(
                icons,
                color:iconColor?? Colors.white,
                size: iconSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}







class BottomWidget extends StatelessWidget {
  const BottomWidget(
      {super.key,
      this.onTap,
      required this.icons,
      required this.body,
      this.height,
      this.width,
  
      this.iconSize});
  final void Function()? onTap;
  final IconData icons;

  
  final double? width, height;
  final double? iconSize;
  final Widget body;
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.all(Radius.circular(16.r)),
      splashColor: Colors.transparent,
      splashFactory:
          InkRipple.splashFactory,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Container(
         
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration:  BoxDecoration(
            color: Colors.white.withOpacity(0.4),
           
           borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
          child: body
        ),
      ),
    );
  }
}
