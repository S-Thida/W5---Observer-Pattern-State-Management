import 'package:flutter/material.dart';
import 'package:flutter_blabla_project/theme/theme.dart';

enum BlaButtonType { primary, secondary }

class BlaButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressedbutton;
  final BlaButtonType type;
  final IconData? icon;
  final bool isDisabled;

  const BlaButton({
    super.key,
    required this.text,
    required this.onPressedbutton,
    this.type = BlaButtonType.primary,
    this.icon,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: isDisabled ? null : onPressedbutton,
      icon: icon != null ? Icon(icon, size: 20) : const SizedBox.shrink(),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: type == BlaButtonType.primary ? Colors.blue : Colors.grey,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
