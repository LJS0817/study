import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/knowledge/Circle.dart';
import 'package:study/knowledge/define.dart';
import 'dart:math' as math;

class ProgressBar_Circle extends StatelessWidget {
  ProgressBar_Circle(double progress, {super.key}) {
    _value = progress;
  }

  double _value = 0;

  @override
  Widget build(BuildContext context) {
    Define define = Provider.of<Define>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${(define.getProgress()*100).round()}%\n",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE7E7E7),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                Positioned(
                  child: Consumer<Define>(
                    builder: (context, value, child) => CustomPaint(
                      painter: Circle(_value),
                      size: const Size(200, 200),
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE7E7E7),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                Positioned(
                  child: Transform.translate(
                    offset: Offset(92.5 * math.cos(3 * math.pi / 2), 92.5 * math.sin(3 * math.pi / 2)),
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Transform.translate(
                    offset: Offset(92.5 * math.cos(3 * math.pi / 2 + (math.pi * 2 * define.getProgress())),
                        92.5 * math.sin(3 * math.pi / 2 + (math.pi * 2 * define.getProgress()))),
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),
      ],
    );
  }
}
