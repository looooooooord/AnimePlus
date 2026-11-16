import '../utils/constants.dart';

class AnimeResults {
  const AnimeResults({
    required this.animeList,
  });

  final List<Anime> animeList;
}

class Anime {
  const Anime({
    this.id = '',
    this.name = '',
    this.imageUrl = '',
    this.status = '',
    this.summary = '',
    this.genres = const [],
    this.episodes = const [],
    this.currentEp = '',
    this.animeUrl = '',
    this.releasedDate = '',
  });

  final String id;
  final String name;
  final String imageUrl;
  final String summary;
  final String status;
  final String animeUrl;
  final List<Genre> genres;
  final List<Episode> episodes;
  final String currentEp;
  final String releasedDate;
}

class Genre {
  final String name;
  final String link;

  Genre({required this.name, required this.link});
}

class Episode {
  final String number;
  final String link;

  Episode({required this.link, required this.number});
}

final List<Genre> genreList = [
  Genre(name: 'أكشن', link: ACTION),
  Genre(name: 'مغامرات', link: ADVENTURE),
  Genre(name: 'كوميديا', link: COMEDY),
  Genre(name: 'دراما', link: DRAMA),
  Genre(name: 'إيتشي', link: ECCHI),
  Genre(name: 'خيال', link: FANTASY),
  Genre(name: 'رعب', link: HORROR),
  Genre(name: 'ماهو شوجو', link: '$sourceBaseUrl/genre/mahou-shoujo/'),
  Genre(name: 'ميكا', link: MECHA),
  Genre(name: 'موسيقى', link: MUSIC),
  Genre(name: 'غموض', link: MYSTERY),
  Genre(name: 'نفسي', link: PSYCHOLOGICAL),
  Genre(name: 'رومانسي', link: ROMANCE),
  Genre(name: 'خيال علمي', link: SCI_FI),
  Genre(name: 'شريحة من الحياة', link: SLICE_OF_LIFE),
  Genre(name: 'رياضة', link: SPORTS),
  Genre(name: 'خارق للطبيعة', link: SUPER_NATURAL),
  Genre(name: 'إثارة', link: THRILLER),
];
