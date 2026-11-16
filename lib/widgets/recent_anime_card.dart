import 'package:flutter/material.dart';
import '../utils/constants.dart';

class RecentAnimeCard extends StatelessWidget {
  const RecentAnimeCard({super.key, required this.currentEp, required this.name});
  final String name;
  final String currentEp;
  @override
  Widget build(BuildContext context) => Container(
        height: 92,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: tkDarkBlue, borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.white10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(currentEp, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: tkCoral, fontSize: 11, fontWeight: FontWeight.w800)),
          const SizedBox(height: 6),
          Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
        ]),
      );
}
