import 'package:flutter/material.dart';

class AlumniCardWidget extends StatefulWidget {
  @override
  _AlumniCardWidgetState createState() => _AlumniCardWidgetState();
}

class _AlumniCardWidgetState extends State<AlumniCardWidget> with SingleTickerProviderStateMixin {
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
          width: 168,
          height: 251,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _borderColorAnimation.value ?? Colors.red, // Animate border color
              width: 2, // Border width
            ),
          ),
          padding: EdgeInsets.all(4),
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
                    top: 5.5,
                    child: Image.asset(
                      'assets/vector.png',
                      width: 170,
                      height: 101.5,
                    ),
                  ),
                  Positioned(
                    top: 90,
                    left: 43.5,
                    child: Center(
                      child: Text(
                        'MILES\nALUMNI',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.white,
                          height: 1.21,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 77,
                    child: Image.asset(
                      'assets/file.png',
                      width: 168,
                      height: 174,
                    ),
                  ),
                  Positioned(
                    top: 229,
                    left: 8,
                    child: Container(
                      width: 65,
                      height: 14,
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                      decoration: BoxDecoration(
                        color: Color(0x38FFFFFF),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/play.png',
                            width: 8,
                            height: 8,
                          ),
                          SizedBox(width: 3),
                          Text(
                            'Watch Now',
                            style: TextStyle(
                              fontFamily: 'SF UI Display',
                              fontWeight: FontWeight.w500,
                              fontSize: 6.5,
                              color: Color(0xFF99CCFF),
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 168,
                      color: Color(0xFF3921FC),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/star.png',
                              width: 8,
                              height: 7,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Living Their American Dream',
                              style: TextStyle(
                                fontFamily: 'Work Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 8,
                                color: Colors.white,
                                height: 1.17,
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
