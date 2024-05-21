import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  late Animation<double> _widthAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _widthAnimation = Tween<double>(
      begin: 0,
      end: 80, // Adjust the final width of the container
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 0.5,
          curve: Curves.easeInOut), // Adjust the curve and interval as needed
    ));

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1,
          curve: Curves.easeInOut), // Adjust the curve and interval as needed
    ));

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
          _buildTopSearchSection(context),
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
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchSection(context: context),
                const SizedBox(
                  width: 5,
                ),
                const BottomNavWidget(
                  icons: Icons.movie_filter,
                  color: Colors.white,
                  iconColor: Colors.grey,
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
                Column(
                  children: [
                    const BottomWidget(
                      icons: Icons.filter_tilt_shift,
                      body: Icon(
                        Icons.wallet,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BottomWidget(
                      icons: Icons.filter_tilt_shift,
                      body: Transform.rotate(
                        angle: 250,
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const BottomWidget(
                  icons: Icons.filter_tilt_shift,
                  body: Row(
                    children: [
                      Icon(
                        Icons.filter_tilt_shift,
                        color: Colors.white,
                      ),
                      Text(
                        "list of variants",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "lato",
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
  }

  Widget _buildPointLocation(String title) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Material(
            color: const Color(0xfffca717),
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
                      fontFamily: "lato",
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
}
