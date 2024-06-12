import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  final Widget child;

  const ScaleAnimation({super.key, required this.child});

  @override
  // ignore: library_private_types_in_public_api
  _ScaleAnimationState createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // Initialisation de l'animation
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    );

    // Tween pour animer la taille de l'objet
    _animation = Tween<double>(begin: 0.8, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    // Lancer l'animation en boucle
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    // Arrêter l'animation
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _animation.value,
      child: widget.child,
    );
  }
}
