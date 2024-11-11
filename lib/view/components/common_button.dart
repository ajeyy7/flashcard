import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String name;
  final void Function() onTap;

  const CommonButton({super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.purple,
      onTap: onTap,
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.purple),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
