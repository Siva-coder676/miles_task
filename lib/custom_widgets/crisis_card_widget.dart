import 'package:flutter/material.dart';

class CrisisCard extends StatefulWidget {
  @override
  _CrisisCardState createState() => _CrisisCardState();
}

class _CrisisCardState extends State<CrisisCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _borderColorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    // Animate border color between red and blue
    _borderColorAnimation = ColorTween(
      begin: Colors.red, // Starting border color
      end: Colors.blue,  // Ending border color
    ).animate(_controller);
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
        return Container(
          width: 162,
          height: 251,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _borderColorAnimation.value ?? Colors.red, // Animate border color
              width: 2, // Border width
            ),
          ),
          padding: EdgeInsets.all(4), // Padding for the content
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF272727),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -8,
                    left: -70,
                    child: Image.asset(
                      'assets/arrow_crisis.png',
                      width: 266,
                      height: 111,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 10,
                    child: Image.asset(
                      'assets/vector_crisis.png',
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Image.asset(
                      'assets/money-crisis.png',
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 3),
                      decoration: BoxDecoration(
                        color: Color(0xFF3921FC),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          'GLOBAL ECONOMY IS IN',
                          style: TextStyle(
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w900,
                            fontSize: 10,
                            color: Color(0xFFFFFFFF),
                            height: 11.73 / 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'CRISIS',
                      style: TextStyle(
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w900,
                        fontSize: 40,
                        color: Color(0xFFFFFFFF),
                        height: 46.92 / 40,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                      decoration: BoxDecoration(
                        color: Color(0x38FFFFFF),
                        borderRadius: BorderRadius.circular(4),
                      ),
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
                              height: 9.55 / 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
