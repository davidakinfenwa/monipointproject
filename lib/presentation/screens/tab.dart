import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monipointproject/presentation/screens/screens.dart';
import 'package:monipointproject/presentation/share/tabscreen_provider.dart';
import 'package:monipointproject/presentation/widget/bottom_nav.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class Tabscreen extends StatefulWidget {
  const Tabscreen({super.key});

  @override
  State<Tabscreen> createState() => _TabscreenState();
}

class _TabscreenState extends State<Tabscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  List<Widget> pageList = [
    const HomeScreen(),
    const SearchScreen(),
    const ReusePage(),
    const ReusePage(),
    const ReusePage(),
  ];
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1, curve: Curves.easeInOutBack)));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

    void _checkPageAndAnimate(int pageIndex) {
    if (pageIndex == 0) {
      // If pageIndex is 0, start the animation
      _controller.forward(from: 0.0);
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabScreenNotifier>(builder: ((context, value, child) {
      _checkPageAndAnimate(value.pageIndex);
      return Scaffold(
        body: Stack(
          children: [
            pageList[value.pageIndex],

            Positioned(
              bottom: 0,
              child: Container(
              width: MediaQuery.sizeOf(context).width.w,
              child:  AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.translate(
                  offset: Offset(0.0,MediaQuery.of(context).size.height *0.1 * _animation.value),
                  child: const BottomMainNav());
            }),)).animate(delay: value.pageIndex == 0 ? 300.ms : Duration.zero,
            ).fadeIn(begin: value.pageIndex == 0 ? -0.1 : 1.0,
            ).move(begin: value.pageIndex == 0 ? const Offset(0, 50) : const Offset(0, 0),end: const Offset(0, 0),
            ),
           
          ],
        ),
       
      );
    }));
  }
}
