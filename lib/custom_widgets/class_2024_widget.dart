import 'package:flutter/material.dart';

class Class2024Widget extends StatefulWidget {
  @override
  _Class2024WidgetState createState() => _Class2024WidgetState();
}

class _Class2024WidgetState extends State<Class2024Widget>
    with SingleTickerProviderStateMixin {
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
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: _borderColorAnimation.value ?? Colors.red, // Animate border color
              width: 2, // Border width
            ),
          ),
          padding: EdgeInsets.all(4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF272727),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0.5,
                    left: 44,
                    child: Image.asset('assets/divider_crisis.png', height: 66.5),
                  ),
                  Positioned(
                    top: 0.5,
                    left: 69.5,
                    child: Image.asset('assets/divider_crisis.png', height: 66.5),
                  ),
                  Positioned(
                    top: 0.5,
                    left: 97.5,
                    child: Image.asset('assets/divider_crisis.png', height: 66.5),
                  ),
                  Positioned(
                    top: 0.5,
                    left: 126.5,
                    child: Image.asset('assets/divider_crisis.png', height: 66.5),
                  ),
                  Positioned(
                    top: 66,
                    left: 125,
                    child: Image.asset('assets/dot_card.png', width: 2.45, height: 2.45),
                  ),
                  Positioned(
                    top: 66,
                    left: 68,
                    child: Image.asset('assets/dot_card.png', width: 2.45, height: 2.45),
                  ),
                  Positioned(
                    top: 65.52,
                    left: 96.04,
                    child: Image.asset('assets/dot_card.png', width: 2.45, height: 2.45),
                  ),
                  Positioned(
                    top: 66,
                    left: 43,
                    child: Image.asset('assets/dot_card.png', width: 2, height: 2),
                  ),
                  Positioned(
                    top: 115,
                    left: 0,
                    child: Image.asset('assets/vector_card3.png', width: 171.5, height: 135.5),
                  ),
                  Positioned(
                    top: 76,
                    left: 50,
                    child: Image.asset('assets/graduate.png', width: 125, height: 178),
                  ),
                  Align(
                    alignment: Alignment(-0.6, -0.4),
                    child: Text(
                      'CLASS OF',
                      style: TextStyle(
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.3, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '2024',
                          style: TextStyle(
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w900,
                            fontSize: 39,
                            color: Color(0xFFFFA548),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 229,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(
                        color: Color(0x38FFFFFF),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/play.png', width: 10, height: 10),
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
                  Positioned(
                    left: 0,
                    child: Container(
                      width: 13,
                      height: 251,
                      color: Color(0xFF3921FC),
                      child: Center(
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                            'C O N G R A T U L A T I O N S',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Work Sans',
                              fontWeight: FontWeight.w800,
                              fontSize: 8,
                              color: Colors.white,
                              height: 1.17,
                            ),
                          ),
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
