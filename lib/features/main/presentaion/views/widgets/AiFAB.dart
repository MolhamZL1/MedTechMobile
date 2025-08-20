import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AiFAB extends StatefulWidget {
  const AiFAB({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  State<AiFAB> createState() => _AiFABState();
}

class _AiFABState extends State<AiFAB> with TickerProviderStateMixin {
  late final AnimationController _pulseC = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);
  late final Animation<double> _pulse = CurvedAnimation(
    parent: _pulseC,
    curve: Curves.easeInOut,
  );

  late final AnimationController _nudgeC = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 6),
  )..repeat();

  @override
  void dispose() {
    _pulseC.dispose();
    _nudgeC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final primary = scheme.primary;

    return Hero(
      tag: 'ai-hero',
      child: AnimatedBuilder(
        animation: Listenable.merge([_pulse, _nudgeC]),
        builder: (context, _) {
          final cycle = _nudgeC.value;
          final isActive = cycle < 0.20;
          final localT = isActive ? (cycle / 0.20) : 0.0;

          double dx = 0.0;
          double rot = 0.0;
          if (isActive) {
            final envelope = Curves.easeInOut.transform(
              (localT <= 0.5) ? (localT * 2) : (1 - (localT - 0.5) * 2),
            );
            final wobble = math.sin(localT * 6.28 * 3);
            dx = wobble * 4.0 * envelope;
            rot = wobble * 0.04 * envelope;
          }

          final scale = 0.98 + (_pulse.value * 0.02);
          final glow = 10 + (_pulse.value * 8);

          return Transform.translate(
            offset: Offset(dx, 0),
            child: Transform.rotate(
              angle: rot,
              child: Transform.scale(
                scale: scale,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primary,
                    boxShadow: [
                      BoxShadow(
                        color: primary.withOpacity(0.35),
                        blurRadius: glow,
                        spreadRadius: _pulse.value * 1.5,
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        HapticFeedback.lightImpact();
                        widget.onPressed?.call();
                      },
                      child: SizedBox(
                        height: 64,
                        width: 64,
                        child: Center(
                          child: Icon(
                            Icons.smart_toy_outlined,
                            color: scheme.onPrimary,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
