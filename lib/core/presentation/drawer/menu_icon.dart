import 'package:flutter/material.dart';

class MenuIcon extends StatefulWidget {
  final ValueChanged<bool> onIconClicked;
  final AnimationController animationController;
  final double size;

  const MenuIcon({
    super.key,
    this.size = 40,
    required this.onIconClicked,
    required this.animationController,
  });

  @override
  State<MenuIcon> createState() => _MenuIconState();
}

class _MenuIconState extends State<MenuIcon> with TickerProviderStateMixin {
  late Animation<double> _menuIconAnimation;

  @override
  void initState() {
    super.initState();

    _menuIconAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: widget.size,
          width: widget.size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _menuIconAnimation.isDismissed
                ? null
                : Theme.of(context).colorScheme.onPrimary,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedIcon(
                color: Theme.of(context).colorScheme.primary,
                icon: AnimatedIcons.menu_close,
                progress: _menuIconAnimation,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        widget.onIconClicked.call(
                          !_menuIconAnimation.isCompleted,
                        );
                      });
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
