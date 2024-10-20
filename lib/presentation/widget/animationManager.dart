import 'package:flutter/material.dart';

class AnimationManager {
  late AnimationController controller;
  late AnimationController controllerImage;
  late Animation<double> widthAnimation;
  late Animation<double> opacityAnimation;
  late Animation<double> profileImageAnimation;
  late Animation<double> mainTextAnimation;
  late Animation<double> countAnimation;
  late Animation<double> count2Animation;
  late Animation<double> sizeAnimation;
  late Animation<double> scaleAnimation;
  late Animation<Offset> slideAnimation;

  final int initialCount = 100;
  final int target2Count = 2212;
  final int targetCount = 1034;
  final double initialSize = 0.0;
  final double targetSize = 150.0;
  final double initialScale = 0.0;
  final double targetScale = 1.0;

  void initializeAnimations(TickerProvider vsync) {
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 3),
    );

    controllerImage = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 5),
    );

    widthAnimation = Tween<double>(begin: 0, end: 170).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0, 0.5, curve: Curves.easeInOut)),
    );

    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.5, 1, curve: Curves.easeInOut)),
    );

    profileImageAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.5, 1, curve: Curves.easeInOut)),
    );

    mainTextAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0, 0.8, curve: Curves.easeInOut)),
    );

    countAnimation = Tween<double>(begin: initialCount.toDouble(), end: targetCount.toDouble()).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    count2Animation = Tween<double>(begin: initialCount.toDouble(), end: target2Count.toDouble()).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    sizeAnimation = Tween<double>(begin: initialSize, end: targetSize).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    scaleAnimation = Tween<double>(begin: initialScale, end: targetScale).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    slideAnimation = Tween<Offset>(begin: const Offset(-1.0, 0.0), end: const Offset(0.0, 0.0)).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    controllerImage.forward();
    controller.forward();
  }

  void dispose() {
    controller.dispose();
    controllerImage.dispose();
  }

  
}
