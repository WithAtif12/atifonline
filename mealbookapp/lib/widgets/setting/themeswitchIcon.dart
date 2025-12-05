import 'package:flutter/material.dart';

class ThemeSwitchIcon extends StatefulWidget {
  final ValueChanged<bool>? onChanged;

  const ThemeSwitchIcon({super.key, this.onChanged});

  @override
  State<ThemeSwitchIcon> createState() => _ThemeSwitchIconState();
}

class _ThemeSwitchIconState extends State<ThemeSwitchIcon> {
  bool isLightMode = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isLightMode,
      onChanged: (val) {
        setState(() {
          isLightMode = val;
        });

        // Notify parent (SettingsScreen)
        if (widget.onChanged != null) {
          widget.onChanged!(val);
        }
      },
      activeColor: Colors.orange,
    );
  }
}
