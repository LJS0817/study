import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:study/knowledge/Circle.dart';
import 'package:study/knowledge/define.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Define define = Provider.of<Define>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Consumer<Define>(
          builder: (context, value, child) => CustomPaint(
            painter: Circle(define.getProgress()),
            size: const Size(200, 200),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          define.Activate();
          Timer.periodic(200.milliseconds, (timer) {
            if(!define.Enable) {
              timer.cancel();
            } else {
              define.Progressing();
            }
          }
          );
        },
        child: Text(
          "T",
        ),
      ),
    );
  }
}
