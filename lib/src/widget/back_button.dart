import 'package:flutter/material.dart';
import 'package:tutor/src/constant/navigation.dart';

class FixBackButton extends StatefulWidget {
  const FixBackButton({super.key});

  @override
  State<FixBackButton> createState() => _FixBackButtonState();
}

class _FixBackButtonState extends State<FixBackButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigateUtils.close(context),
      child: Container(
        height: 40,
        width: 40,
        color: Colors.transparent,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
