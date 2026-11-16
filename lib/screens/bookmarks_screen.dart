import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/bookmark_manager.dart';
import '../utils/constants.dart';
import '../widgets/tako_loading_indicator.dart';

class BookMarksScreen extends StatefulWidget {
  const BookMarksScreen({super.key});
  @override
  State<BookMarksScreen> createState() => _BookMarksScreenState();
}
class _BookMarksScreenState extends State<BookMarksScreen> with AutomaticKeepAliveClientMixin {
  final bookmarkManager = Get.find<BookMarkManager>();
  late final Future<void> _bookmarksFuture;
  @override
  void initState() { super.initState(); _bookmarksFuture = bookmarkManager.loadBookMarksFromDatabase(); }
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<void>(
      future: _bookmarksFuture,
      builder: (_, snapshot) => GetBuilder<BookMarkManager>(builder: (_) {
        if (snapshot.connectionState != ConnectionState.done && bookmarkManager.bookMarks.isEmpty) return const TakoLoadingView(avoidBottomNavigation: true);
        if (bookmarkManager.bookMarks.isEmpty) return const Center(child: Text('لا توجد محفوظات'));
        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 104),
          itemCount: bookmarkManager.bookMarks.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (_, index) {
            final bookmark = bookmarkManager.bookMarks[index];
            return ListTile(
              tileColor: tkDarkBlue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              title: Text(bookmark.name, maxLines: 2, overflow: TextOverflow.ellipsis),
              trailing: IconButton(
                tooltip: 'إزالة',
                icon: const Icon(Icons.bookmark_remove_outlined, color: tkMutedText),
                onPressed: () async { await bookmarkManager.removeFromBookMarks(bookmark); setState(() {}); },
              ),
            );
          },
        );
      }),
    );
  }
}
