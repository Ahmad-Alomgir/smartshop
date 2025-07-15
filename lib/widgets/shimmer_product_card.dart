import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProductCard extends StatelessWidget {
  const ShimmerProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 110, color: Colors.white),
              const SizedBox(height: 8),
              Container(height: 15, width: double.infinity, color: Colors.white),
              const SizedBox(height: 6),
              Container(height: 15, width: 100, color: Colors.white),
              const SizedBox(height: 6),
              Container(height: 20, width: 80, color: Colors.white),
              const Spacer(),
              Container(height: 36, width: double.infinity, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
