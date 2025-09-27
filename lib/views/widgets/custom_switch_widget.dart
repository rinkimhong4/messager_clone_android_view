import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class CustomAdvanceSwitch extends StatefulWidget {
  final double radius;
  final double thumbRadius;
  final Widget? activeChild;
  final Widget? inactiveChild;
  const CustomAdvanceSwitch({
    super.key,
    this.radius = 40,
    this.thumbRadius = 100,
    this.activeChild,
    this.inactiveChild,
  });

  @override
  State<CustomAdvanceSwitch> createState() => _CustomAdvanceSwitchState();
}

class CustomAdvanceSwitches extends StatelessWidget {
  const CustomAdvanceSwitches({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomAdvanceSwitch(),
        SizedBox(height: 10),
        CustomAdvanceSwitch(radius: 3, thumbRadius: 2),
        SizedBox(height: 10),
        CustomAdvanceSwitch(
          activeChild: Icon(Icons.done, size: 10),
          inactiveChild: Icon(Icons.close, size: 10),
        ),
        SizedBox(height: 10),
        CustomAdvanceSwitch(
          activeChild: Icon(Icons.dark_mode, size: 10),
          inactiveChild: Icon(Icons.light_mode, size: 10),
        ),
      ],
    );
  }
}

class _CustomAdvanceSwitchState extends State<CustomAdvanceSwitch> {
  final _controller00 = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      activeColor: Colors.blue,
      inactiveColor: Colors.grey.withValues(alpha: 0.5),

      // ON text with left padding
      activeChild:
          widget.activeChild ??
          const Padding(
            padding: EdgeInsets.only(left: 6), // space from thumb
            child: Text(
              'ON',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

      // OFF text with right padding
      inactiveChild:
          widget.inactiveChild ??
          const Padding(
            padding: EdgeInsets.only(right: 6),
            child: Text(
              'OFF',
              style: TextStyle(
                color: Colors.black,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

      borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
      width: 60,
      height: 32,
      thumb: Container(
        margin: const EdgeInsets.all(7),
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(widget.thumbRadius),
        ),
      ),
      controller: _controller00,
    );
  }
}
