import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

class BottomNavigationComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          BottomNavBackground(),
          Positioned(
            bottom: 15,
            child: SpiralNavigation(),
          ),
        ],
      ),
    );
  }
}

class SpiralNavigation extends StatelessWidget {
  final List<NavItem> items = [
    NavItem(icon: 'assets/home.svg', label: 'Home'),
    NavItem(icon: 'assets/reels.svg', label: 'Reels'),
    NavItem(icon: 'assets/torch.svg', label: 'USP'),
    NavItem(icon: 'assets/event.svg', label: 'Events'),
    NavItem(icon: 'assets/person.svg', label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    // Rearranged positions to start from left to right in sequence
    List<Offset> positions = [
      Offset((screenWidth / 2) - 140, 15),  // Home (far left)
      Offset((screenWidth / 2) - 70, 5),   // Reels (left)
      Offset(screenWidth / 2, 0),          // USP (center)
      Offset((screenWidth / 2) + 70, 5),   // Events (right)
      Offset((screenWidth / 2) + 140, 15), // Profile (far right)
    ];

    return Container(
      width: screenWidth,
      height: 80,
      child: Stack(
        children: List.generate(items.length, (index) {
          return Positioned(
            left: positions[index].dx - 20,
            top: positions[index].dy,
            child: NavItemWidget(
              item: items[index],
              isCenter: index == 2, // Now USP is in center
            ),
          );
        }),
      ),
    );
  }
}

class NavItem {
  final String icon;
  final String label;

  NavItem({required this.icon, required this.label});
}

class NavItemWidget extends StatelessWidget {
  final NavItem item;
  final bool isCenter;

  const NavItemWidget({
    required this.item,
    this.isCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: isCenter ? 32 : 24,
            height: isCenter ? 32 : 24,
            padding: EdgeInsets.all(isCenter ? 4 : 2),
            decoration: isCenter ? BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              shape: BoxShape.circle,
            ) : null,
            child: SvgPicture.asset(
              item.icon,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4),
          Text(
            item.label,
            style: TextStyle(
              fontSize: isCenter ? 11 : 10,
              fontWeight: isCenter ? FontWeight.w400 : FontWeight.w300,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class BottomNavBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: CustomPaint(
        size: Size(MediaQuery.of(context).size.width, 120),
        painter: BackgroundPainter(),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint gradientPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          Color(0xFF090909),
          Color(0xFF1F1F1F),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    Path path = Path();
    path.moveTo(0, 60);
    path.quadraticBezierTo(size.width / 2, -10, size.width, 60);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, gradientPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}