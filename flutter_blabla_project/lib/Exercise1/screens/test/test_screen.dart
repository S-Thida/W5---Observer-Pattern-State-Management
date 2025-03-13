import 'package:flutter/material.dart';
import '../../widgets/actions/blabutton.dart';

class BlaButtonTestScreen extends StatelessWidget {
  const BlaButtonTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BlaButton Test")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlaButton(
              text: "Primary Button",
              onPressedbutton: () => print("Primary Clicked"),
              type: BlaButtonType.primary,
            ),
            const SizedBox(height: 10),
            BlaButton(
              text: "Secondary Button",
              onPressedbutton: () => print("Secondary Clicked"),
              type: BlaButtonType.secondary,
            ),
            const SizedBox(height: 10),
            BlaButton(
              text: "Button with Icon",
              onPressedbutton: () => print("Icon Button Clicked"),
              type: BlaButtonType.primary,
              icon: Icons.check,
            ),
            const SizedBox(height: 10),
            BlaButton(
              text: "Disabled Button",
              onPressedbutton: () {},
              type: BlaButtonType.primary,
              isDisabled: true,
            ),
          ],
        ),
      ),
    );
  }
}
void main(){
  return runApp(MaterialApp( title:"Home", home: BlaButtonTestScreen(),));

}