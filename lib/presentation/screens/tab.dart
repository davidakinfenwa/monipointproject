import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monipointproject/presentation/screens/chat.dart';
import 'package:monipointproject/presentation/screens/favorite.dart';
import 'package:monipointproject/presentation/screens/home.dart';
import 'package:monipointproject/presentation/screens/profile.dart';
import 'package:monipointproject/presentation/screens/search.dart';
import 'package:monipointproject/presentation/share/tabscreen_provider.dart';
import 'package:monipointproject/presentation/widget/bottom_nav.dart';
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
    const ChatScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
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
        curve: Interval(0.5, 1, curve: Curves.easeInOutBack)));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabScreenNotifier>(builder: ((context, value, child) {
      return Scaffold(
       // backgroundColor: Colors.red,
        body: Stack(
          children: [
            pageList[value.pageIndex],

            Positioned(
              bottom: 0,
              child: Container(
                //color: Colors.red,
                 width: MediaQuery.sizeOf(context).width.w,
                //alignment: Alignment.center,
                child:  AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.translate(
                  offset: Offset(
                      0.0,
                      MediaQuery.of(context).size.height *
                          0.1 *
                          _animation.value),
                  child: const BottomMainNav());
            }),))
          ],
        ),
        // bottomNavigationBar: 
        // AnimatedBuilder(
        //     animation: _controller,
        //     builder: (context, child) {
        //       return Transform.translate(
        //           offset: Offset(
        //               0.0,
        //               MediaQuery.of(context).size.height *
        //                   0.1 *
        //                   _animation.value),
        //           child: const BottomMainNav());
        //     }),
      );
    }));
  }
}
