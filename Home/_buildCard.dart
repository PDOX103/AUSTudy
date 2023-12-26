import 'package:flutter/material.dart';

class BuildCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  const BuildCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 50),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style:const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}