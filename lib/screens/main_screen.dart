import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/bookmarks_screen.dart';
import '../screens/recent_list_screen.dart';
import '../utils/constants.dart';
import '../widgets/anime_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final PageController _pageController;
  var currentIndex = 0;
  final pages = [RecentListScreen(), const BookMarksScreen()];
  final titles = const ['السجل', 'المحفوظات'];

  @override
  void initState() { super.initState(); _pageController = PageController(); }
  @override
  void dispose() { _pageController.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const AnimeDrawer(),
        appBar: AppBar(
          toolbarHeight: 74,
          title: Text(titles[currentIndex], style: GoogleFonts.dmSans(fontSize: 23, fontWeight: FontWeight.w700)),
        ),
        body: PageView(
          controller: _pageController,
          children: pages,
          onPageChanged: (index) => setState(() => currentIndex = index),
        ),
        bottomNavigationBar: SafeArea(
          minimum: const EdgeInsets.fromLTRB(24, 0, 24, 12),
          child: Container(
            height: 64,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(color: tkDarkBlue, borderRadius: BorderRadius.circular(36), border: Border.all(color: const Color(0xFF302D55))),
            child: Row(children: [
              _item(0, Icons.history_rounded, 'السجل'),
              _item(1, Icons.bookmark_border_rounded, 'المحفوظات'),
            ]),
          ),
        ),
      );

  Widget _item(int index, IconData icon, String label) {
    final selected = currentIndex == index;
    return Expanded(child: InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () { setState(() => currentIndex = index); _pageController.animateToPage(index, duration: const Duration(milliseconds: 280), curve: Curves.easeOut); },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 190), height: 52,
        decoration: BoxDecoration(color: selected ? tkGradientBlue : Colors.transparent, borderRadius: BorderRadius.circular(28)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, size: 22, color: selected ? tkDarkerBlue : const Color(0xFFD3D1E5)),
          if (selected) ...[const SizedBox(width: 8), Text(label, style: GoogleFonts.dmSans(color: tkDarkerBlue, fontSize: 13, fontWeight: FontWeight.w800))],
        ]),
      ),
    ));
  }
}
