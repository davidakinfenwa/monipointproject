import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monipointproject/presentation/widget/backdrop.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controllerImage;
  late Animation<double> _widthAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _profileImageAnimation;
  late Animation<double> _mainTextAnimation;
  late Animation<double> _countAnimation;
  late Animation<double> _count2Animation;
  late Animation<double> _sizeAnimation;
  late Animation<double> _scaleAnimation;

  late Animation<Offset> _slideAnimation;

  final int initialCount = 100;
  final int target2Count = 2212;
  final int targetCount = 1034;
  final double initialSize = 0.0;
  final double targetSize = 150.0;
  final double initialScale = 0.0;
  final double targetScale = 1.0;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Adjust the duration as needed
    );
    _controllerImage = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Adjust the duration as needed
    );

    _widthAnimation = Tween<double>(
      begin: 0,
      end: 170, // Adjust the final width of the container
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

    _profileImageAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
        //_controllerImage
        CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1,
          curve: Curves.easeInOut), // Adjust the curve and interval as needed
    ));

    _mainTextAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.5, curve: Curves.easeInOut),
      ),
    );

    _countAnimation = Tween<double>(
      begin: initialCount.toDouble(),
      end: targetCount.toDouble(),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _count2Animation = Tween<double>(
      begin: initialCount.toDouble(),
      end: target2Count.toDouble(),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _sizeAnimation = Tween<double>(
      begin: initialSize,
      end: targetSize,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: initialScale,
      end: targetScale,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), // Slide in from the left
      end: const Offset(0.0, 0.0), // Slide to the center
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controllerImage.forward();
    _controller.forward();
    _updateImageContainer(); // Start the animation
  }

  @override
  void dispose() {
    _controllerImage.dispose();
    _controller.dispose();
    super.dispose();
  }

  double _width = 0;
  double _height = 0;

  double _widthcon = 0;
  double _heightcon = 0;

  void _updateImageContainer() {
    if (_width == 0) {
      setState(() {
        _width = 50;
        _height = 50;
      });
    }
    if (_widthcon == 0) {
      setState(() {
        _widthcon = 150;
        _heightcon = 150;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        //
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFfefcfb),
              Color(0xFFfedbb1),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 2.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Column(
          children: [
            _buildTopSection(),
            _buildBottomCardSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomCardSection() {
    return Expanded(
            child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                        0.0,
                        MediaQuery.of(context).size.height *
                            _mainTextAnimation.value),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32))),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildBottomPanelFirstCard(),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
  }

  Widget _buildTopSection() {
    return Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Container(
                          width: _widthAnimation.value,
                          padding: const EdgeInsets.fromLTRB(10, 15, 10,
                              15), // Adjust the height of the container
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Opacity(
                            opacity: _opacityAnimation.value,
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.place,
                                  color: Colors.grey,
                                ),
                                Text(
                                  'Saint Petersburg',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontFamily: "lato"),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    
                    AnimatedBuilder(
                        animation: _controllerImage,
                        builder: (context, child) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            width: _width * _profileImageAnimation.value,
                            height: _height * _profileImageAnimation.value,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                //color: Colors.blue,
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/profileimg.png")) // Placeholder color, replace with your image
                                ),
                          );
                        }),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _opacityAnimation.value,
                        child: const Text(
                          'Hi, Marina',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "lato"),
                        ),
                      );
                    }),
                //const SizedBox( height: 1, ),
                AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Container(
                        child: Transform.translate(
                          offset: Offset(
                              0.0,
                              MediaQuery.of(context).size.height *
                                  0.1 *
                                  _mainTextAnimation.value),
                          // Adjust the distance
                          child: Opacity(
                            opacity: 1 - (_mainTextAnimation.value * 0.5),
                            child: const SizedBox(
                              width: 250,
                              child: Text(
                                'let\'s select your perfect place',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontFamily: "lato"),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _scaleAnimation.value,
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: const BoxDecoration(
                              color: Color(0xfffca717),
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  "Buy",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "lato",
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Text(
                                  _countAnimation.value.toInt().toString(),
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontFamily: "lato",
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  "offers",
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
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _scaleAnimation.value,
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                //color: const Color.fromARGB(255, 241, 240, 238),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18)
                                // shape: BoxShape.circle,
                                ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  "Rent",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "lato",
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffb0987f),
                                  ),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Text(
                                  _count2Animation.value.toInt().toString(),
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontFamily: "lato",
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffb0987f),
                                  ),
                                ),
                                const Text(
                                  "offers",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "lato",
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffb0987f),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
  }

  Widget _buildBottomPanelFirstCard() {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bedroom.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Glassmorphism(
                    blur: 5,
                    opacity: 0.2,
                    radius: 16,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Container(
                        decoration: ShapeDecoration(
                            //color: Color.fromARGB(131, 0, 0, 0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AnimatedOpacity(
                              opacity: _opacityAnimation.value,
                              duration: const Duration(seconds: 4),
                              child: Text('Gladkova st., 25',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "lato")),
                            ),
        
                            const SizedBox(
                              width: 50,
                            ),
                            //Animate this container from the beginning of the row to the end  with a slide right
                            Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    color: Colors.white, shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 14,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
        SizedBox(height: 10.h,),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
              Expanded(
                child: Stack(
                          children: [
                            ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  width: MediaQuery.sizeOf(context).width/1.5,
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bedroom.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                            ),
                            Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Glassmorphism(
                      blur: 5,
                      opacity: 0.2,
                      radius: 16,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: Container(
                          decoration: ShapeDecoration(
                              //color: Color.fromARGB(131, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AnimatedOpacity(
                                opacity: _opacityAnimation.value,
                                duration: const Duration(seconds: 4),
                                child: Text('Gladk st., 25',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "lato")),
                              ),
                        
                              const SizedBox(
                                width: 15,
                              ),
                              //Animate this container from the beginning of the row to the end  with a slide right
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: Colors.white, shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 14,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))
                          ],
                        ),
              ),
              SizedBox(width: 5,),
        Expanded(
          child: Column(children: [
              Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  width: MediaQuery.sizeOf(context).width/1.3,
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bedroom.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Glassmorphism(
                      blur: 5,
                      opacity: 0.2,
                      radius: 16,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: Container(
                          decoration: ShapeDecoration(
                              //color: Color.fromARGB(131, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AnimatedOpacity(
                                opacity: _opacityAnimation.value,
                                duration: const Duration(seconds: 4),
                                child: Text('Glad st., 25',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "lato")),
                              ),
          
                              const SizedBox(
                                width: 25,
                              ),
                              
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: Colors.white, shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 14,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
          SizedBox(height: 6,),
            Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  width: MediaQuery.sizeOf(context).width/1.3,
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bedroom.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Glassmorphism(
                      blur: 5,
                      opacity: 0.2,
                      radius: 16,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: Container(
                          decoration: ShapeDecoration(
                              //color: Color.fromARGB(131, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AnimatedOpacity(
                                opacity: _opacityAnimation.value,
                                duration: const Duration(seconds: 4),
                                child: Text('Glad st., 25',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "lato")),
                              ),
          
                              const SizedBox(
                                width: 25,
                              ),
                            
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: Colors.white, shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 14,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
          ],),
        )
          ],
        )
      ],
    );
  }
}
