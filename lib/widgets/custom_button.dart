import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onTap,
      required this.text,
      required this.color,
      required this.textColor});
  final void Function()? onTap;
  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 55,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.grey, width: 2),
            // borderRadius: BorderRadius.circular(
            //   8,
            // ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                //  fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
