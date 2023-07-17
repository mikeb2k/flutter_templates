import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_templates/templates/numericKeyboard.dart';

String pass = "1234";

class PinScreen extends StatefulWidget {
  final int pinCount;
  final String title;
  final bool snackBar;
  final Color? textColor;
  final Color? keyboardColor;
  final Color? visibleColor;
  final Color? deleteColor;
  final Color? pinColor;
  final Color? errorColor;
  final String? snackBarText;

  const PinScreen(
      {Key? key,
      required this.title,
      required this.pinCount,
      required this.snackBar,
      this.textColor,
      this.keyboardColor,
      this.visibleColor,
      this.deleteColor,
      this.pinColor,
      this.errorColor,
      this.snackBarText})
      : super(key: key);

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  final shakeKey = GlobalKey<ShakeWidgetState>();
  bool isHidden = true;
  bool isDisabled = false;
  bool deleteDisabled = false;
  String pin = "";
  Color pinColor = Colors.black;
  int duration = 500;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: 50, bottom: MediaQuery.of(context).size.height * 0.25),
          child: Text(
            widget.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: widget.textColor),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Center(
            child: ShakeWidget(
              key: shakeKey,
              shakeOffset: 10,
              shakeCount: 5,
              shakeDuration: Duration(milliseconds: duration),
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.pinCount,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 10);
                },
                itemBuilder: (context, index) {
                  return pinCircle(index);
                },
              ),
            ),
          ),
        ),
        const Spacer(),
        NumKeyboard(
          textColor: widget.keyboardColor ?? Colors.black,
          disableBtns: isDisabled,
          onKeyboardTap: (text) {
            pin = pin + text;
            if (widget.pinCount == pin.length) {
              setState(() {
                isDisabled = true;
                deleteDisabled = false;
              });
              if (pin != pass) {
                shakeKey.currentState?.shake();
                setState(() {
                  isDisabled = false;
                  pinColor = widget.errorColor ?? Colors.red;
                });
                widget.snackBar
                    ? ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(widget.snackBarText ?? "")))
                    : null;
                Future.delayed(Duration(milliseconds: duration)).then((_) {
                  setState(() {
                    pinColor = widget.pinColor ?? Colors.black;
                    pin = "";
                  });
                });
              } else {
                setState(() {
                  pinColor = Colors.green;
                });
              }
            } else {
              setState(() {
                isDisabled = false;
                deleteDisabled = false;
              });
            }
          },
          leftButtonFn: () {
            setState(() {
              isHidden = !isHidden;
            });
          },
          leftIcon: Icon(
              isHidden
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              color: widget.visibleColor),
          rightButtonFn: deleteDisabled
              ? null
              : () {
                  if (pin.isNotEmpty) {
                    pin = pin.substring(0, pin.length - 1);
                    setState(() {
                      isDisabled = false;
                    });
                  }
                  setState(() {
                    if (pin.isEmpty) {
                      isDisabled = false;
                      deleteDisabled = true;
                    }
                  });
                },
          rightIcon: Icon(Icons.arrow_back_ios_rounded,
              color: deleteDisabled
                  ? widget.deleteColor!.withOpacity(0.75)
                  : widget.deleteColor),
        ),
        const SizedBox(height: 50),
      ],
    ));
  }

  Widget pinCircle(int index) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 75),
      crossFadeState:
          isHidden ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: Icon(
          pin.length > index ? Icons.circle : Icons.circle_outlined,
          color: pinColor),
      secondChild: Text(
        index + 1 > pin.length ? "" : pin[index],
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, color: pinColor),
      ),
    );
  }
}

abstract class AnimationControllerState<T extends StatefulWidget>
    extends State<T> with SingleTickerProviderStateMixin {
  AnimationControllerState(this.animationDuration);
  final Duration animationDuration;
  late final animationController =
      AnimationController(vsync: this, duration: animationDuration);

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class ShakeWidget extends StatefulWidget {
  const ShakeWidget({
    Key? key,
    required this.child,
    required this.shakeOffset,
    this.shakeCount = 3,
    this.shakeDuration = const Duration(milliseconds: 400),
  }) : super(key: key);
  final Widget child;
  final double shakeOffset;
  final int shakeCount;
  final Duration shakeDuration;

  @override
  // ignore: no_logic_in_create_state
  ShakeWidgetState createState() => ShakeWidgetState(shakeDuration);
}

class ShakeWidgetState extends AnimationControllerState<ShakeWidget> {
  ShakeWidgetState(Duration duration) : super(duration);

  @override
  void initState() {
    super.initState();
    animationController.addStatusListener(_updateStatus);
  }

  @override
  void dispose() {
    animationController.removeStatusListener(_updateStatus);
    super.dispose();
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reset();
    }
  }

  void shake() {
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // 1. return an AnimatedBuilder
    return AnimatedBuilder(
      // 2. pass our custom animation as an argument
      animation: animationController,
      // 3. optimization: pass the given child as an argument
      child: widget.child,
      builder: (context, child) {
        final sineValue =
            sin(widget.shakeCount * 2 * pi * animationController.value);
        return Transform.translate(
          // 4. apply a translation as a function of the animation value
          offset: Offset(sineValue * widget.shakeOffset, 0),
          // 5. use the child widget
          child: child,
        );
      },
    );
  }
}
