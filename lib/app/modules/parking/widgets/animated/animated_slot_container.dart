import 'package:flutter/material.dart';

class AnimatedSlotContainer extends StatefulWidget {
  const AnimatedSlotContainer({ Key? key }) : super(key: key);

  @override
  _AnimatedSlotContainerState createState() => _AnimatedSlotContainerState();
}

class _AnimatedSlotContainerState extends State<AnimatedSlotContainer> with SingleTickerProviderStateMixin {
  double borderWidth = 1.0;


  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
    upperBound: 0.6,
    lowerBound: 0.5
  )..repeat(reverse: true);


  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOutBack,
  );
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: borderWidth
          ),
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.yellow.withOpacity(0.2)
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}