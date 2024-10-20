import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monipointproject/core/theme.dart';
import 'package:monipointproject/presentation/widget/bottomnav_widget.dart';
import 'package:monipointproject/presentation/widget/search_form.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation, _opacityAnimation, _animationToggle;
 late AnimationController _animationController;

  bool _showPopover = false; // To track popover visibility

  // Function to toggle popover visibility
void _togglePopover() {
  if (_showPopover) {
    _animationController.reverse();  // Hide popover
  } else {
    _animationController.forward();  // Show popover
  }
  setState(() {
    _showPopover = !_showPopover;
  });
}

  @override
  void initState() {
    _controller =AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationController = AnimationController(duration: const Duration(milliseconds: 300), vsync: this,  // if you're in a stateful widget
);

    _widthAnimation = Tween<double>(begin: 0,end: 80,).animate(
      CurvedAnimation(parent: _controller,curve: const Interval(0, 0.5, curve: Curves.easeInOut),));
    _opacityAnimation = Tween<double>(begin: 0,end: 1,).animate(
      CurvedAnimation(parent: _controller,curve: const Interval(0.5, 1, curve: Curves.easeInOut),));

  _animationToggle = Tween<double>(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(parent: _animationController,curve: Curves.easeInOut,));

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildImageSection(context),
          _buildTopSearchSection(context).animate().fade().flipV(delay: 400.ms),
          Positioned(
              left: MediaQuery.sizeOf(context).width * 0.5,
              top: MediaQuery.sizeOf(context).height * 0.3,
              child: _buildPointLocation("10.4 m/s")),
          Positioned(
              left: MediaQuery.sizeOf(context).width * 0.2,
              top: MediaQuery.sizeOf(context).height * 0.3,
              child: _buildPointLocation("10.4 m/s")),
          Positioned(
              left: MediaQuery.sizeOf(context).width * 0.2,
              top: MediaQuery.sizeOf(context).height * 0.6,
              child: _buildPointLocation("13.4 m/s")),

          // if (_showPopover) ...[
            Positioned(
              //top: 0, // Adjust to control vertical position
              left: 20,
              right: 170,
              bottom: 150,
              child: _buildPopover(),
            ),
          // ],
          _buildNavSection(context),
          Align(
              alignment: Alignment.center,
              child: _buildPointLocation("5.4 m/s"))
        ],
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Image.asset(
          "assets/images/map2.jpg",
          fit: BoxFit.cover,
        ));
  }

  Widget _buildTopSearchSection(BuildContext context) {
    return Positioned(
        child: Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchSection(context: context),
            const SizedBox(
              width: 5,
            ),
             BottomNavWidget(
              height: 40,
              width: 40,
              icons: "settings.svg",
              color: Colors.white,
              iconColor: AppColors.secondaryColor.withOpacity(0.8),
            )
          ],
        ),
      ),
    ));
  }

  Widget _buildNavSection(BuildContext context) {
    return Positioned(
        left: MediaQuery.sizeOf(context).width * 0.09,
        bottom: MediaQuery.sizeOf(context).height * 0.12,
        right: MediaQuery.sizeOf(context).width * 0.09,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildNavInteractions().animate().fadeIn(delay:1000.ms).scaleY(),
            BottomWidget(
              icons: Icons.filter_tilt_shift,
              body: Row(
                children: [
                 SvgPicture.asset(
                      "assets/svgs/textalign.svg",
                      color: Colors.white,
                      height: 20,
                      width: 20,
                      
                    ),
                    SizedBox(width: 10,),
                  const Text(
                    "List of variants",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: FontFamilyy.regular,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 1000.ms).scaleX(),
          ],
        ));
  }



Widget _buildPopover() {
  return AnimatedBuilder(
    animation: _animationController,
    builder: (context, child) {
      return Opacity(
        opacity: _animationToggle.value,
        child: Transform.translate(
          offset: Offset(0, 10 * (1 - _animationToggle.value)),  // Adjust based on how you want the animation to look
          child: child,
        ),
      );
    },
    child: _showPopover ? _buildPoper().animate()
                  .fadeIn(begin: -0.1, delay: 300.ms)
                  .move(begin: const Offset(0, 50), end: const Offset(10, 0)) : Container(),
  );
}

  Widget _buildNavInteractions() {
    return Column(
      children: [
         BottomWidget(
          icons: Icons.filter_tilt_shift,
          body: SvgPicture.asset(
              "assets/svgs/walleticon.svg",color: Colors.white,height: 20,width: 20,  ),
        ),
        SizedBox(
          height: 10,
        ),

        GestureDetector(
          onTap: _togglePopover,
          child: BottomWidget(
              icons: Icons.filter_tilt_shift,
            body: SvgPicture.asset(
                        "assets/svgs/sendmessage.svg",
                        color: Colors.white,
                        height: 20,
                        width: 20,
                        
            ),
          ),
        ),
    
      ],
    );
  }

  Widget _buildPointLocation(String title) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Material(
            color: AppColors.primaryColor,
            elevation: 2,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
            // borderRadius: BorderRadius,
            child: Container(
              height: 50,
              width: _widthAnimation.value,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(),
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: FontFamilyy.regular,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget _buildPoper(){
    return Container(
//margin:const EdgeInsets.symmetric(horizontal: 30), // Adjust positioning
       // padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                _buildListItem("bagdeicon.svg","Cosy area",1),
                _buildListItem("walleticon.svg","Price",2),
                _buildListItem("bagicon.svg","Infrastructure",1),
                _buildListItem("layericon.svg","Without any layer",1),
             
              ],
            ),
          ],
        ),
      );
  }

  Widget _buildListItem(String image, String title, int value){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
        SvgPicture.asset(
                        "assets/svgs/$image",
                        color:value==2?AppColors.primaryColor: AppColors.secondaryColor.withOpacity(0.6),
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(width: 10,),
                      Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color:value==2?AppColors.primaryColor:AppColors.secondaryColor.withOpacity(0.6),fontWeight: FontWeight.w400,fontFamily: FontFamilyy.normal,fontSize: 13.sp)),
                  
      ],),
    );
  }
}
