import 'package:flashcard/constants/colors.dart';
import 'package:flutter/material.dart';

class CardFront extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CardFront({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        key: const ValueKey("front"),
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [purpleDark, purpleLight],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 32),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.volume_up_outlined,
                        color: white,
                      ),
                      Text(
                        text,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: black,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class CardBack extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CardBack({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        key: const ValueKey("back"),
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [purpleLight, purpleDark],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }}