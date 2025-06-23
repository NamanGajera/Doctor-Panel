import 'package:flutter/material.dart';

class ImageSection extends StatefulWidget {
  const ImageSection({super.key});

  @override
  State<ImageSection> createState() => _ImageSectionState();
}

class _ImageSectionState extends State<ImageSection> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    const Color(0xff0165fc).withValues(alpha: 0.7),
                    const Color(0xff0A4D68),
                  ],
                ),
              ),
            ),
          ),
          Image.asset(
            'assets/images/login_imsage.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      const Color(0xff0165fc).withValues(alpha: 0.7),
                      const Color(0xff0A4D68),
                    ],
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.landscape,
                    size: 80,
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
