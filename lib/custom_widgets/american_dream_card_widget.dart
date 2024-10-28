import 'package:flutter/material.dart';

class AmericanDreamCard extends StatefulWidget {
  @override
  _AmericanDreamCardState createState() => _AmericanDreamCardState();
}

class _AmericanDreamCardState extends State<AmericanDreamCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _borderColorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true); // Repeat the animation

    _borderColorAnimation = ColorTween(
      begin: Colors.red, // Starting color
      end: Colors.blue, // Ending color
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 162,
      height: 251,
      decoration: BoxDecoration(
        color: Color(0xFF272727),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: _borderColorAnimation.value ?? Colors.red, // Animate border color
          width: 2, // Border width
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 103,
            left: -17,
            child: Image.asset(
              'assets/background_card.png',
              width: 202,
              height: 144,
            ),
          ),
          Positioned(
            top: 85,
            left: -4,
            child: Image.asset(
              'assets/vector4.png',
              width: 170,
              height: 101.5,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              'AMERICAN\nDREAM',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 28,
                color: Colors.white,
              ),
            ),
          ),
          // "Watch Now" container placed above the "Live your Great" section
          Positioned(
            bottom: 10,
            left: 8,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0x38FFFFFF),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              child: Row(
                children: [
                  Image.asset(
                    'assets/play.png',
                    width: 10,
                    height: 10,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Watch Now',
                    style: TextStyle(
                      fontFamily: 'SF UI Display',
                      fontWeight: FontWeight.w500,
                      fontSize: 8,
                      color: Color(0xFF99CCFF),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // "Live your Great" container moved further down
          Positioned(
            bottom: 2,
            child: Container(
              width: 190,
              color: Color(0xFF3921FC),
              child: Row(
                children: [
                  Image.asset(
                    'assets/star.png',
                    width: 8,
                    height: 7,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Live your Great',
                    style: TextStyle(
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 8,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 4),
                  Image.asset(
                    'assets/star.png',
                    width: 8,
                    height: 7,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
