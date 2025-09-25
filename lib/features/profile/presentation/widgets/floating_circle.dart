import 'package:flutter/material.dart';

class FloatingCircle extends StatefulWidget {
  final double size;
  final Color color;
  final double startX;
  final double startY;
  final int durationSeconds;
  final double xBegin;
  final double xEnd;
  final double yBegin;
  final double yEnd;

  const FloatingCircle({
    super.key,
    required this.size,
    required this.color,
    required this.startX,
    required this.startY,
    this.durationSeconds = 3,
    this.xBegin = -10,
    this.xEnd = 10,
    this.yBegin = -10,
    this.yEnd = 10,
  });

  @override
  State<FloatingCircle> createState() => _FloatingCircleState();
}

class _FloatingCircleState extends State<FloatingCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationX;
  late Animation<double> _animationY;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.durationSeconds),
    )..repeat(reverse: true);

    _animationX = Tween<double>(
      begin: widget.xBegin,
      end: widget.xEnd,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _animationY = Tween<double>(
      begin: widget.yBegin,
      end: widget.yEnd,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_animationX.value, _animationY.value),
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: widget.color,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}