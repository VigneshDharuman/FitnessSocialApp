import 'package:flutter/material.dart';

class ThriveSpaceLogo extends StatelessWidget {
  final double size;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? backgroundColor;

  const ThriveSpaceLogo({
    super.key,
    this.size = 80,
    this.primaryColor,
    this.secondaryColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final primary = primaryColor ?? const Color(0xFF22c55e);
    final secondary = secondaryColor ?? const Color(0xFF0891b2);
    final bg = backgroundColor ?? Colors.white;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
        border: Border.all(
          color: primary,
          width: size * 0.06,
        ),
      ),
      child: ClipOval(
        child: Stack(
          children: [
            // Background
            Container(
              width: size,
              height: size,
              color: bg,
            ),
            
            // Central tree/person figure
            Positioned(
              bottom: size * 0.15,
              left: size * 0.35,
              right: size * 0.35,
              child: Container(
                height: size * 0.7,
                child: CustomPaint(
                  painter: CentralFigurePainter(
                    color: secondary,
                    size: size,
                  ),
                ),
              ),
            ),
            
            // Top leaves
            Positioned(
              top: size * 0.15,
              left: size * 0.25,
              child: Transform.rotate(
                angle: -0.3,
                child: Container(
                  width: size * 0.2,
                  height: size * 0.15,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(size * 0.1),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size * 0.15,
              right: size * 0.25,
              child: Transform.rotate(
                angle: 0.3,
                child: Container(
                  width: size * 0.2,
                  height: size * 0.15,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(size * 0.1),
                  ),
                ),
              ),
            ),
            
            // Left community group
            Positioned(
              bottom: size * 0.1,
              left: size * 0.05,
              child: _buildCommunityGroup(secondary, size * 0.25, true),
            ),
            
            // Right community group  
            Positioned(
              bottom: size * 0.1,
              right: size * 0.05,
              child: _buildCommunityGroup(secondary, size * 0.25, false),
            ),
            
            // Small center head
            Positioned(
              top: size * 0.25,
              left: size * 0.45,
              child: Container(
                width: size * 0.1,
                height: size * 0.1,
                decoration: BoxDecoration(
                  color: secondary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildCommunityGroup(Color color, double groupSize, bool isLeft) {
    return SizedBox(
      width: groupSize,
      height: groupSize,
      child: Stack(
        children: [
          // Back person (smaller)
          Positioned(
            bottom: 0,
            left: isLeft ? groupSize * 0.1 : groupSize * 0.4,
            child: Container(
              width: groupSize * 0.35,
              height: groupSize * 0.8,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(groupSize * 0.1),
              ),
            ),
          ),
          // Front person (larger)  
          Positioned(
            bottom: 0,
            left: isLeft ? groupSize * 0.4 : groupSize * 0.1,
            child: Container(
              width: groupSize * 0.45,
              height: groupSize,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(groupSize * 0.12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CentralFigurePainter extends CustomPainter {
  final Color color;
  final double size;

  CentralFigurePainter({required this.color, required this.size});

  @override
  void paint(Canvas canvas, Size canvasSize) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    
    // Create Y-shaped figure (tree/person with arms raised)
    final width = canvasSize.width;
    final height = canvasSize.height;
    
    // Main trunk/body
    path.moveTo(width * 0.4, height);
    path.lineTo(width * 0.6, height);
    path.lineTo(width * 0.55, height * 0.4);
    path.lineTo(width * 0.45, height * 0.4);
    path.close();
    
    // Left arm/branch
    path.moveTo(width * 0.45, height * 0.5);
    path.lineTo(width * 0.1, height * 0.2);
    path.lineTo(width * 0.2, height * 0.15);
    path.lineTo(width * 0.5, height * 0.4);
    path.close();
    
    // Right arm/branch
    path.moveTo(width * 0.55, height * 0.5);
    path.lineTo(width * 0.9, height * 0.2);
    path.lineTo(width * 0.8, height * 0.15);
    path.lineTo(width * 0.5, height * 0.4);
    path.close();
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}