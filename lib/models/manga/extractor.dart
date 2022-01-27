import 'package:utilx/utilities/locale.dart';
import './chapter/info.dart';
import './info.dart';
import './page/info.dart';
import '../base/extractor.dart';
import '../base/image_describer.dart';

typedef GetMangaInfoFn = Future<MangaInfo> Function(String, Locale);

typedef GetChapterFn = Future<List<PageInfo>> Function(ChapterInfo);

typedef GetPageFn = Future<ImageDescriber> Function(PageInfo);

class MangaExtractor extends BaseExtractor {
  const MangaExtractor({
    required final Locale defaultLocale,
    required final SearchFn search,
    required final this.getInfo,
    required final this.getChapter,
    required final this.getPage,
  }) : super(defaultLocale: defaultLocale, search: search);

  final GetMangaInfoFn getInfo;
  final GetChapterFn getChapter;
  final GetPageFn getPage;
}
