import 'package:flutter/material.dart';

class CommunityLogo extends StatelessWidget {
  final double size;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? iconColor;
  final double borderWidth;
  final bool showShadow;

  const CommunityLogo({
    super.key,
    this.size = 60,
    this.backgroundColor,
    this.borderColor,
    this.iconColor,
    this.borderWidth = 2,
    this.showShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor ?? const Color(0xFF22c55e),
          width: borderWidth,
        ),
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Stack(
        children: [
          // People icons positioned around the circle
          Positioned(
            top: size * 0.15,
            left: size * 0.3,
            child: Icon(
              Icons.person,
              size: size * 0.15,
              color: iconColor ?? const Color(0xFF22c55e),
            ),
          ),
          Positioned(
            top: size * 0.15,
            right: size * 0.3,
            child: Icon(
              Icons.person,
              size: size * 0.15,
              color: iconColor ?? const Color(0xFF22c55e),
            ),
          ),
          Positioned(
            bottom: size * 0.25,
            left: size * 0.15,
            child: Icon(
              Icons.person,
              size: size * 0.15,
              color: iconColor ?? const Color(0xFF22c55e),
            ),
          ),
          Positioned(
            bottom: size * 0.25,
            right: size * 0.15,
            child: Icon(
              Icons.person,
              size: size * 0.15,
              color: iconColor ?? const Color(0xFF22c55e),
            ),
          ),
          // Leaves around the circle
          Positioned(
            top: size * 0.05,
            left: size * 0.4,
            child: Transform.rotate(
              angle: -0.5,
              child: Icon(
                Icons.eco,
                size: size * 0.12,
                color: (iconColor ?? const Color(0xFF22c55e)).withOpacity(0.8),
              ),
            ),
          ),
          Positioned(
            top: size * 0.35,
            left: size * 0.02,
            child: Transform.rotate(
              angle: 1.2,
              child: Icon(
                Icons.eco,
                size: size * 0.12,
                color: (iconColor ?? const Color(0xFF22c55e)).withOpacity(0.8),
              ),
            ),
          ),
          Positioned(
            top: size * 0.35,
            right: size * 0.02,
            child: Transform.rotate(
              angle: -1.2,
              child: Icon(
                Icons.eco,
                size: size * 0.12,
                color: (iconColor ?? const Color(0xFF22c55e)).withOpacity(0.8),
              ),
            ),
          ),
          Positioned(
            bottom: size * 0.05,
            left: size * 0.35,
            child: Transform.rotate(
              angle: 0.8,
              child: Icon(
                Icons.eco,
                size: size * 0.12,
                color: (iconColor ?? const Color(0xFF22c55e)).withOpacity(0.8),
              ),
            ),
          ),
          Positioned(
            bottom: size * 0.05,
            right: size * 0.35,
            child: Transform.rotate(
              angle: -0.8,
              child: Icon(
                Icons.eco,
                size: size * 0.12,
                color: (iconColor ?? const Color(0xFF22c55e)).withOpacity(0.8),
              ),
            ),
          ),
          // Center wellness heart
          Center(
            child: Icon(
              Icons.favorite,
              size: size * 0.2,
              color: iconColor ?? const Color(0xFF22c55e),
            ),
          ),
        ],
      ),
    );
  }
}