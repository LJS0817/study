import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:study/knowledge/ProgressBar.dart';
import 'package:study/knowledge/define.dart';

class Home extends StatefulWidget {
  Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> ani;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    ani = Tween(begin: 0.0, end: 1.toDouble()).animate(_controller)
      ..addListener(() {
        Provider.of<Define>(context, listen: false).Progressing(ani.value);
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

  }

  @override
  Widget build(BuildContext context) {
    Define define = Provider.of<Define>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ProgressBar_Circle(ani.value),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          define.Activate();
          Timer.periodic(200.milliseconds, (timer) {
            if(!define.Enable) {
              timer.cancel();
              _controller.stop();
            } else {
              _controller.forward();
              // define.Progressing();
            }
          }
          );
        },
        child: Text(
          "F",
        ),
      ),
    );
  }
}
