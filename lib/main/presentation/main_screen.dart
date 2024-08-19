import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../about/presentation/about_screen.dart';
import '../../categories_list/presentation/categories_screen.dart';
import '../../core/presentation/drawer/main_menu.dart';
import '../../core/presentation/drawer/main_menu_items.dart';
import '../../core/presentation/drawer/menu_icon.dart';
import '../../core/presentation/drawer/menu_item.dart';

class MainScreen extends StatefulWidget {
  final Widget child;

  const MainScreen({
    super.key,
    required this.child,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  static const double _menuSize = 240;
  static const double _swipeOpenMenuThreshold = 25;

  final _animationDuration = const Duration(milliseconds: 300);
  final Curve _defaultAnimationCurve = Curves.easeInOut;

  late AnimationController _mainScreenAnimationController;
  late AnimationController _menuIconAnimationController;

  late Animation<double> _mainScreenAnimation;
  late Animation<double> _scaleAnimation;

  void _forwardAnimations() {
    _mainScreenAnimationController.forward();
    _menuIconAnimationController.forward();
  }

  void _reverseAnimations() {
    _mainScreenAnimationController.reverse();
    _menuIconAnimationController.reverse();
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final dx = details.delta.dx;
    if (dx.abs() < _swipeOpenMenuThreshold) {
      return;
    }
    if (_mainScreenAnimation.isCompleted && dx < 0) {
      _reverseAnimations();
    } else if (_mainScreenAnimation.isDismissed && dx > 0) {
      _forwardAnimations();
    }
  }

  @override
  void initState() {
    super.initState();
    _mainScreenAnimationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    _menuIconAnimationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    _mainScreenAnimation = CurvedAnimation(
      parent: _mainScreenAnimationController,
      curve: _defaultAnimationCurve,
    )..addListener(() => setState(() {}));

    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: _mainScreenAnimationController,
        curve: _defaultAnimationCurve,
      ),
    );
  }

  @override
  void dispose() {
    _menuIconAnimationController.dispose();
    _mainScreenAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          Positioned(
            width: _menuSize,
            left: _mainScreenAnimation.value * _menuSize - _menuSize,
            height: MediaQuery.of(context).size.height,
            child: MainMenu(
              items: menuItems,
              onItemSelected: (item) {
                switch (item) {
                  case HomeMenuItem():
                    context.goNamed(CategoriesScreen.screenName);
                  case AboutMenuItem():
                    context.goNamed(AboutScreen.screenName);
                }
                _reverseAnimations();
              },
              width: _menuSize,
            ),
          ),
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(
                _mainScreenAnimation.value -
                    30 * _mainScreenAnimation.value * math.pi / 180,
              ),
            alignment: Alignment.center,
            child: Transform.translate(
              offset: Offset(_mainScreenAnimation.value * _menuSize, 0),
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(_mainScreenAnimation.value * 24),
                  child: GestureDetector(
                    onHorizontalDragUpdate: _onHorizontalDragUpdate,
                    child: Container(
                      child: widget.child,
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            top: 8,
            left: _mainScreenAnimation.isCompleted ? _menuSize - 45 : 8,
            duration: _animationDuration,
            curve: Curves.fastOutSlowIn,
            child: MenuIcon(
              animationController: _menuIconAnimationController,
              onIconClicked: (selected) {
                if (!selected) {
                  _reverseAnimations();
                } else {
                  _forwardAnimations();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
