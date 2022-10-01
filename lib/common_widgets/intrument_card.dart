import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'dart:math' as math;

class InstrumentCard extends StatefulWidget {
  String imageUrl;
  String title;
  int index;
  int currIndex;
  InstrumentCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.index,
      required this.currIndex});

  @override
  State<InstrumentCard> createState() => _InstrumentCardState();
}

class _InstrumentCardState extends State<InstrumentCard>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController controller2;
  int pageOnView = 0;
  int itemIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        duration: Duration(seconds: 1));
    controller2 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    controller2.animateTo(1);

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    logic() {
      if (widget.currIndex == 0 || widget.currIndex == 3) {
        controller2.animateTo(1);
      } else if (widget.currIndex == widget.index) {
        controller2.animateTo(1);
      } else {
        controller2.animateTo(0.8);
      }

      if (widget.currIndex == widget.index) {
        _controller.animateTo(0);
      } else if (widget.currIndex < widget.index) {
        _controller.animateTo(10);
      } else {
        _controller.animateTo(-10);
      }
    }

    logic();

    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: controller2.value,
            child: Transform.rotate(
              angle: (math.pi / 180) * _controller.value,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                    ),
                    Positioned.fill(
                        child: Container(
                      margin: EdgeInsets.only(top: 80, left: 20),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20)),
                    )),
                    Positioned.fill(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(widget.imageUrl),
                    )),
                    Positioned.fill(
                        bottom: 10,
                        child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            )))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
