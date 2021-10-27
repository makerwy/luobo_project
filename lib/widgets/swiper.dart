import 'dart:async';

import 'package:flutter/material.dart';

abstract class SwiperIndicator {
  Widget build(BuildContext context, int index, int itemCount);
}

class _SwiperIndicator implements SwiperIndicator {
  final double spacing;
  final Color itemColor;
  final Color? activeItemColor;
  final double itemWidth;
  final double itemHeight;
  final BoxShape itemShape;
  final EdgeInsetsGeometry? padding;

  _SwiperIndicator({
    this.spacing = 0.0,
    this.itemColor = Colors.white70,
    this.activeItemColor,
    this.padding,
    required this.itemWidth,
    required this.itemHeight,
    required this.itemShape,
  });

  @override
  Widget build(BuildContext context, int index, int itemCount) {
    if (itemCount == 0) {
      return const SizedBox(
        width: .0,
        height: .0,
      );
    }
    var children = List.generate(itemCount, (itemIndex) {
      Color color = itemColor;
      if (itemIndex == index) {
        color = activeItemColor ?? Theme.of(context).colorScheme.secondary;
      }
      return Container(
          width: itemWidth,
          height: itemHeight,
          decoration: BoxDecoration(color: color, shape: itemShape));
    });
    return Padding(
      padding: padding ?? const EdgeInsets.all(10.0),
      child: Wrap(
        children: children,
        spacing: spacing,
        runSpacing: spacing,
      ),
    );
  }
}

class RectangleSwiperIndicator extends _SwiperIndicator {
  RectangleSwiperIndicator({
    EdgeInsetsGeometry? padding,
    double spacing = 4.0,
    double itemWidth = 16.0,
    double itemHeight = 2.0,
    Color itemColor = Colors.white70,
    Color? itemActiveColor,
  }) : super(
            padding: padding,
            spacing: spacing,
            itemWidth: itemWidth,
            itemHeight: itemHeight,
            itemColor: itemColor,
            activeItemColor: itemActiveColor,
            itemShape: BoxShape.rectangle);
}

class CircleSwiperIndicator extends _SwiperIndicator {
  CircleSwiperIndicator({
    EdgeInsetsGeometry? padding,
    double spacing = 6.0,
    double radius = 3.5,
    Color itemColor = Colors.white70,
    Color? itemActiveColor,
  }) : super(
            padding: padding,
            spacing: spacing,
            itemWidth: radius * 2,
            itemHeight: radius * 2,
            itemColor: itemColor,
            activeItemColor: itemActiveColor,
            itemShape: BoxShape.circle);
}

class Indicator extends StatefulWidget {
  const Indicator(
      {Key? key,
      required this.indicator,
      required this.initialPage,
      required this.itemCount})
      : super(key: key);

  final SwiperIndicator indicator;
  final int initialPage;
  final int itemCount;

  @override
  _IndicatorState createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _index = widget.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    return widget.indicator.build(context, _index, widget.itemCount);
  }

  void update(int index) {
    setState(() {
      _index = index;
    });
  }
}

class Swiper extends StatefulWidget {
  Swiper({
    Key? key,
    this.direction = Axis.horizontal,
    this.reverse = false,
    this.speed = 300,
    this.autoStart = true,
    this.indicator,
    this.indicatorAlignment = AlignmentDirectional.bottomCenter,
    this.circular = true,
    this.interval = const Duration(seconds: 3),
    this.viewportFraction = 1.0,
    this.onChanged,
    required this.children,
  })  : childCount = children!.length,
        itemBuilder = ((context, index) => children[index]),
        super(key: key);

  const Swiper.builder({
    Key? key,
    this.direction = Axis.horizontal,
    this.reverse = false,
    this.speed = 3000,
    this.autoStart = true,
    this.indicator,
    this.indicatorAlignment = AlignmentDirectional.bottomCenter,
    this.circular = true,
    this.interval = const Duration(seconds: 3),
    this.viewportFraction = 1.0,
    this.onChanged,
    required this.childCount,
    required this.itemBuilder,
  })  : children = null,
        super(key: key);

  final Axis direction;
  final bool reverse;
  final int speed;
  final int childCount;
  final bool autoStart;
  final SwiperIndicator? indicator;
  final AlignmentDirectional indicatorAlignment;
  final bool circular;
  final Duration interval;
  final double viewportFraction;
  final List<Widget>? children;
  final IndexedWidgetBuilder itemBuilder;
  final ValueChanged<int>? onChanged;

  @override
  _SwiperState createState() => _SwiperState();
}

class _SwiperState extends State<Swiper> {
  PageController? _pageController;
  int _index = 0;
  Timer? _timer;
  bool _autoPlay = false;
  bool _animateToPage = false;
  final _globalkey = GlobalKey<_IndicatorState>();

  @override
  void initState() {
    super.initState();
    _initPageController();
    if (widget.autoStart) {
      start();
    }
  }

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    children.add(PageView.builder(
        scrollDirection: widget.direction,
        reverse: widget.reverse,
        controller: _pageController,
        itemCount: widget.circular && widget.childCount != 1
            ? null
            : widget.childCount,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) {
          return widget.itemBuilder(context, index % widget.childCount);
        }));
    if (widget.indicator != null) {
      var indicator = Indicator(
        key: _globalkey,
        initialPage: getIndex(),
        itemCount: widget.childCount,
        indicator: widget.indicator!,
      );
      children.add(Positioned(
        child: indicator,
      ));
    }
    return Listener(
      onPointerDown: (e) => _timer?.cancel(),
      onPointerUp: (e) => _start(),
      onPointerCancel: (e) => _start(),
      child: Stack(
        alignment: widget.indicatorAlignment,
        children: children,
      ),
    );
  }

  @override
  void dispose() {
    // widget.controller?._detach();
    _pageController?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  int getIndex() => _index % widget.childCount;

  start() {
    _autoPlay = true;
    _start();
  }

  stop() {
    _autoPlay = false;
    _timer?.cancel();
  }

  Future<void> animateToPage(
    int page, {
    required Duration duration,
    required Curve curve,
  }) async {
    if (widget.childCount < 2) return;

    int dest = page % widget.childCount;

    //不循环
    if (!widget.circular) {
      var cur = getIndex();
      page = dest;
      var last = widget.childCount - 1;
      if (page == cur ||
          (cur == 0 && page == last) ||
          //到最后一个page后，如果没有自动播放则什么也不做，否则需要回到第一个page
          (!_autoPlay && cur == last && page == 0)) {
        return;
      }
    } else {
      int distance = dest - getIndex();
      //检查是目标页是否当前页
      if (distance == 0) {
        return;
      }
    }

    _animateToPage = true;

    return _pageController
        ?.animateToPage(page, duration: duration, curve: curve)
        .then((e) {
      _globalkey.currentState?.update(getIndex());
      if (widget.onChanged != null) widget.onChanged!(dest);
      _animateToPage = false;
    });
  }

  void _initPageController([int? index]) {
    _pageController?.dispose();
    _index = index ?? 0;

    // if (widget.circular) {
    //   _index = widget.childCount + _index;
    // } else {
    //   _index = getIndex();
    // }
    _index = getIndex();

    _pageController = PageController(
      initialPage: _index,
      viewportFraction: widget.viewportFraction,
    );
  }

  void _onPageChanged(int index) {
    if (widget.circular && index < widget.childCount) {
      _index = widget.childCount + index;
      _pageController!.jumpToPage(_index);
      return;
    } else {
      _index = index;
    }
    _globalkey.currentState?.update(getIndex());
    if (!_animateToPage && widget.onChanged != null) {
      widget.onChanged!(getIndex());
    }
  }

  void _start() {
    if (!_autoPlay || widget.childCount < 2) return;
    _timer?.cancel();
    _timer = Timer.periodic(widget.interval, (timer) {
      animateToPage(
        widget.circular ? _index + 1 : (_index + 1) % widget.childCount,
        duration: Duration(milliseconds: widget.speed),
        curve: Curves.easeOut,
      );
    });
  }
}
/**
 * SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16.0 / 9.0,
                child: Swiper(
                  indicator: RectangleSwiperIndicator(),
                  onChanged: (index) => debugPrint('$index'),
                  children: images,
                ),
              ),
              AspectRatio(
                aspectRatio: 16.0 / 9.0,
                child: Swiper(
                  indicator: CircleSwiperIndicator(),
                  onChanged: (index) => debugPrint('$index'),
                  children: images,
                ),
              ),
              AspectRatio(
                aspectRatio: 16.0 / 9.0,
                child: Swiper(
                  indicator: CircleSwiperIndicator(),
                  onChanged: (index) => debugPrint('$index'),
                  viewportFraction: .9,
                  children: images
                      .map((e) => Padding(
                          child: e,
                          padding: const EdgeInsets.symmetric(horizontal: 5)))
                      .toList(),
                ),
              )
            ]
                .map((e) => Padding(
                    child: e,
                    padding: const EdgeInsets.symmetric(vertical: 10)))
                .toList(),
          ),
        ),
      )
 * 
 */