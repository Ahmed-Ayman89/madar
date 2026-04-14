import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/routing/routes.dart';
import '../widgets/particle_painter.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> _particles = [];
  final Random _random = Random();
  bool _showLogo = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..addListener(_updateParticles);

    _controller.forward();

    Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        _showLogo = true;
      });
    });

    Timer(const Duration(seconds: 4), () {
      if (mounted) {
        context.go(Routes.kOnboardingView);
      }
    });
  }

  void _updateParticles() {
    if (_particles.length < 100) {
      _particles.add(
        Particle(
          position: Offset(
            _random.nextDouble() * 400,
            _random.nextDouble() * 800,
          ),
          velocity: Offset(
            (_random.nextDouble() - 0.5) * 2,
            (_random.nextDouble() - 0.5) * 2,
          ),
          size: _random.nextDouble() * 3 + 1,
          color: AppColors.primary300.withValues(alpha: 0.8),
        ),
      );
    }

    for (var particle in _particles) {
      particle.update();
    }
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBlue900,
      body: Stack(
        children: [
          CustomPaint(
            painter: ParticlePainter(
              particles: _particles,
              animationValue: 1.0 - _controller.value,
            ),
            child: Container(),
          ),
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1000),
              opacity: _showLogo ? 1.0 : 0.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary500.withValues(alpha: 0.5),
                          blurRadius: 30,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/photo/madar_logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'MADAR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                      shadows: [
                        Shadow(color: AppColors.primary500, blurRadius: 10),
                      ],
                    ),
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
