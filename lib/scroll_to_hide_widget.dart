import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollToHideWidget extends StatefulWidget {
  final Duration duration;
  final ScrollController controller;
  final Widget child;
  const ScrollToHideWidget(
      {super.key,
      required this.duration,
      required this.controller,
      required this.child});

  @override
  State<ScrollToHideWidget> createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (widget.controller.position.userScrollDirection == ScrollDirection.reverse) {
      hide();
    } else if (widget.controller.position.userScrollDirection == ScrollDirection.forward) {
      show();
    }
  }

  void show() {
    if (!_isVisible) {
      setState(() {
        _isVisible = true;
      });
    }
  }

  void hide() {
    if (_isVisible) {
      setState(() {
        _isVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      height: _isVisible ? kBottomNavigationBarHeight : 0,
      child: widget.child,
    );
  }
}