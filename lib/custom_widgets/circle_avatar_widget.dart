import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatefulWidget {
  final String assetPath;
  final double size;
  final String? name;

  const CircleAvatarWidget({
    Key? key,
    required this.assetPath,
    this.size = 70.0,
    this.name // Default size for the avatar
  }) : super(key: key);

  @override
  _CircleAvatarWidgetState createState() => _CircleAvatarWidgetState();
}

class _CircleAvatarWidgetState extends State<CircleAvatarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(); // Repeat the animation for a continuous flow
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
        return Column(
          children: [
            Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: SweepGradient(
                  startAngle: 0.0,
                  endAngle: 6.2832, // 2 * pi for a full circle
                  colors: [
                    Colors.red,
                    Colors.green,
                    Colors.blue,
                    Colors.red, // Close the loop with the starting color
                  ],
                  stops: [
                    _controller.value,
                    _controller.value + 0.3,
                    _controller.value + 0.6,
                    1.0,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0), // Border width
                child: CircleAvatar(
                  backgroundImage: AssetImage(widget.assetPath),
                  radius: widget.size / 2 - 3, // Adjust for padding
                ),
              ),
            ),
            Text(
              widget.name!,
              style: TextStyle(
                fontFamily: 'SF UI Display',
                fontWeight: FontWeight.w300,
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}
