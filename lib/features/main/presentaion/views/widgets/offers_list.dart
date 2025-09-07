import 'dart:async';
import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/main/domain/entity/adv_entity.dart';

class OfferSlide {
  final AdvEntity advEntity;

  const OfferSlide({required this.advEntity});
}

class AutoOfferCarousel extends StatefulWidget {
  const AutoOfferCarousel({
    super.key,
    required this.slides,
    this.height = 160,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.borderRadius = 16,
  });

  final List<OfferSlide> slides;
  final double height;
  final Duration autoPlayInterval;
  final double borderRadius;

  @override
  State<AutoOfferCarousel> createState() => _AutoOfferCarouselState();
}

class _AutoOfferCarouselState extends State<AutoOfferCarousel> {
  static const int _kLoopMultiplier = 1000; // big offset for infinite feel
  late PageController _ctrl;
  Timer? _timer;
  int _rawIndex = 0; // tracks the real page (can be large)

  int get _len => widget.slides.length;
  int get _initialPage => (_len == 0) ? 0 : _len * _kLoopMultiplier;

  @override
  void initState() {
    super.initState();
    _ctrl = PageController(viewportFraction: 0.92, initialPage: _initialPage);
    _rawIndex = _initialPage;
    _startAutoPlay();
  }

  @override
  void didUpdateWidget(covariant AutoOfferCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.slides.length != widget.slides.length && _len > 0) {
      // reset to a fresh center to keep looping smooth
      _ctrl.jumpToPage(_initialPage);
      _rawIndex = _initialPage;
      _startAutoPlay();
    }
  }

  void _startAutoPlay() {
    _timer?.cancel();
    if (_len < 2) return; // no need to autoplay with <2 slides
    _timer = Timer.periodic(widget.autoPlayInterval, (_) {
      if (!mounted || !_ctrl.hasClients) return;
      _ctrl.nextPage(
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_len == 0) return const SizedBox.shrink();
    final t = Theme.of(context);
    final dotIndex = _rawIndex % _len;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _ctrl,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (i) => setState(() => _rawIndex = i),
            itemBuilder: (context, i) {
              final slide = widget.slides[i % _len]; // loop content
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: _OfferCard(slide: slide, radius: widget.borderRadius),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_len, (i) {
            final selected = i == dotIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 6,
              width: selected ? 16 : 6,
              decoration: BoxDecoration(
                color:
                    selected
                        ? t.colorScheme.primary
                        : t.colorScheme.primary.withOpacity(.3),
                borderRadius: BorderRadius.circular(99),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _OfferCard extends StatelessWidget {
  const _OfferCard({required this.slide, required this.radius});
  final OfferSlide slide;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.06),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Image.network(
                slide.advEntity.imageUrl,
                fit: BoxFit.cover,
                errorBuilder:
                    (_, __, ___) => Container(
                      color: t.colorScheme.primary.withOpacity(.08),
                    ),
              ),
            ),
            Positioned.fill(
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [Colors.black54, Colors.transparent],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 14,
              right: 14,
              bottom: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    slide.advEntity.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: t.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      letterSpacing: .2,
                    ),
                  ),
                  if (slide.advEntity.bio != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      slide.advEntity.bio!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: t.textTheme.bodySmall?.copyWith(
                        color: Colors.white.withOpacity(.9),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
