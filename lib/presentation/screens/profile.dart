
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monipointproject/core/theme.dart';
import 'package:monipointproject/presentation/widget/animationManager.dart';
import 'package:monipointproject/presentation/widget/backdrop.dart';


class ReusePage extends StatefulWidget {
  const ReusePage({super.key});

  @override
  State<ReusePage> createState() => _ReusePageState();
}

class _ReusePageState extends State<ReusePage> with TickerProviderStateMixin {
    late AnimationManager _animationManager;
      late AnimationController _controllerImage;

      @override
  void initState() {
    super.initState();
    _animationManager = AnimationManager();
    _animationManager.initializeAnimations(this);
    _controllerImage = AnimationController(vsync: this,duration: const Duration(seconds: 5), );
      _controllerImage.forward();
     _updateImageContainer();
  }

  @override
  void dispose() {
    _animationManager.dispose();
    _controllerImage.dispose();
    super.dispose();
  }
 

  double _width = 0;
  double _height = 0;
  double _widthcon = 0;
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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
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
                animation: _animationManager.controller,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0.0, MediaQuery.of(context).size.height * _animationManager.mainTextAnimation.value),
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
                      animation: _animationManager.controller,
                      builder: (context, child) {
                        return Container(
                          width: _animationManager.widthAnimation.value,
                          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 15), // Adjust the height of the container
                          decoration: BoxDecoration(
                            color: Colors.white,
                        
                           boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.01),
                              spreadRadius: 1,
                              blurRadius: 3,
                            ),
                          ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Opacity(
                            opacity: _animationManager.opacityAnimation.value,
                            child:  Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/svgs/locationicon.svg",
                                  color: Colors.grey,
                                   width: 16,
                                   height: 16,
                                ),
                                const SizedBox(width: 5,),
                                Text(
                                  'Saint Petersburg',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.grey,
                                      fontWeight:FontWeight.w500,
                                      fontFamily: FontFamilyy.normal
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    
                    AnimatedBuilder(
                        animation: _animationManager.controllerImage,
                        builder: (context, child) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            width: _width * _animationManager.profileImageAnimation.value,
                            height: _height * _animationManager.profileImageAnimation.value,
                            decoration:  BoxDecoration(
                                gradient: LinearGradient(
                                colors: [
                                  const Color(0xffd75e0e),
                                  AppColors.primaryColor,
                                ],
                                
                                stops: [-8.0, 10.0],
                                tileMode: TileMode.mirror,
                              ),
                                shape: BoxShape.circle,
                                image: const DecorationImage(image: AssetImage("assets/images/profile.png")) // Placeholder color, replace with your image
                                ),
                          );
                        }),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                AnimatedBuilder(
                    animation: _animationManager.controller,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _animationManager.opacityAnimation.value,
                        child:  Text(
                          'Hi, Marina',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.grey,
                              fontFamily: FontFamilyy.regular),
                        ),
                      );
                    }),
                //const SizedBox( height: 1, ),
                AnimatedBuilder(
                    animation: _animationManager.controller,
                    builder: (context, child) {
                      return Container(
                        child: Transform.translate(
                          offset: Offset(
                              0.0,
                              MediaQuery.of(context).size.height *
                                  0.1 *
                                  _animationManager.mainTextAnimation.value),
                          // Adjust the distance
                          child: Opacity(
                            opacity: 1 - (_animationManager.mainTextAnimation.value * 0.5),
                            child:  SizedBox(
                              width: 250,
                              child: Text(
                                'let\'s select your perfect place',
                                style: TextStyle(
                                    fontSize: 30,
                                    height: 1.12,
                                    color: AppColors.secondaryColor,
                                    fontFamily: FontFamilyy.normal),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _animationManager.controller,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _animationManager.scaleAnimation.value,
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration:  BoxDecoration(
                              color: AppColors.primaryColor,
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
                                    fontFamily: FontFamilyy.regular,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Text(
                                  _animationManager.countAnimation.value.toInt().toString(),
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontFamily: FontFamilyy.regular,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  "offers",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: FontFamilyy.regular,
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
                    const SizedBox(width: 10,),
                    AnimatedBuilder(
                      animation: _animationManager.controller,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _animationManager.scaleAnimation.value,
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
                                    fontFamily: FontFamilyy.regular,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffb0987f),
                                  ),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Text(
                                  _animationManager.count2Animation.value.toInt().toString(),
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontFamily: FontFamilyy.regular,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffb0987f),
                                  ),
                                ),
                                const Text(
                                  "offers",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: FontFamilyy.regular,
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
                    image: AssetImage("assets/images/hotleroom.png"),
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
                  padding: const EdgeInsets.all(10),
                  child: Glassmorphism(
                    blur: 10,
                    opacity: 0.5,
                    radius: 30,
                    child: SlideTransition(
                      position: _animationManager.slideAnimation,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AnimatedOpacity(
                              opacity: _animationManager.opacityAnimation.value,
                              duration: const Duration(seconds: 4),
                              child: Text('Gladkova st., 25',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color: AppColors.secondaryColor,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: FontFamilyy.normal)),
                            ),
        
                            const SizedBox(
                              width: 40,
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                width: 45,
                                  decoration:  BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(42),
                                        boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 6,
                                          offset: const Offset(0.2, 0.4)
                                        ),
                                      ],
                                      ),
                                  child:  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
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
                      image: AssetImage("assets/images/hotelroom1.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),),
                 Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                    child: Glassmorphism(
                      blur: 5,
                      opacity: 0.2,
                      radius: 16,
                      child: SlideTransition(
                        position: _animationManager.slideAnimation,
                        child: Container(
                           height:  40.h,
                          decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AnimatedOpacity(
                                opacity: _animationManager.opacityAnimation.value,
                                duration: const Duration(seconds: 4),
                                child: Text('Gubina st., 11',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.secondaryColor,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: FontFamilyy.normal,
                                          fontSize: 14.sp)),
                              ),
                        
                              const SizedBox(
                                width: 15,
                              ),
                              //Animate this container from the beginning of the row to the end  with a slide right
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                                  child: const Icon(Icons.arrow_forward_ios_outlined,size: 14,)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))
                          ],
                        ),
              ),
      const SizedBox(width: 5,),
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
                      image: AssetImage("assets/images/guest_room.jpg"),
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
                    padding:const EdgeInsets.symmetric(horizontal: 4,vertical: 8),
                    child: Glassmorphism(
                      blur: 5,
                      opacity: 0.2,
                      radius: 16,
                      child: SlideTransition(
                      position: _animationManager.slideAnimation,
                        child: Container(
                          decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                                const SizedBox(width: 3,),
                              AnimatedOpacity(
                                opacity: _animationManager.opacityAnimation.value,
                                duration: const Duration(seconds: 4),
                                child: Text('Trefoleva st., 43',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.secondaryColor,fontWeight: FontWeight.w400,fontFamily: FontFamilyy.normal,fontSize: 13.sp)),

                              ),
          
                              const SizedBox(
                                width: 20,
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
          const SizedBox(height: 6,),
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
                    padding: EdgeInsets.symmetric(horizontal: 4.h,vertical: 8.w),
                    child: Glassmorphism(
                      blur: 5,
                      opacity: 0.2,
                      radius: 16,
                      child: SlideTransition(
                        position: _animationManager.slideAnimation,
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
                                opacity: _animationManager.opacityAnimation.value,
                                duration: const Duration(seconds: 4),
                                child: Text('Sadova st., 22',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.secondaryColor,fontWeight: FontWeight.w400,fontFamily: FontFamilyy.normal,fontSize: 13.sp)),
                              ),
          
                              const SizedBox(
                                width: 20,
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
        ),
        SizedBox(height: 50.h,)
      ],
    );
  }
}
