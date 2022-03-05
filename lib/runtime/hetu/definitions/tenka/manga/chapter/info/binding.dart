import 'package:hetu_script/binding.dart';
import 'package:hetu_script/hetu_script.dart';
import 'package:tenka/tenka.dart';
import 'package:utilx/locale.dart';
import '../../../../../model.dart';

class ChapterInfoClassBinding extends HTExternalClass {
  ChapterInfoClassBinding() : super('ChapterInfo');

  @override
  dynamic memberGet(
    final String varName, {
    final String? from,
  }) {
    switch (varName) {
      case 'ChapterInfo':
        return createHTExternalFunction(
          (
            final HTEntity entity, {
            final List<dynamic> positionalArgs = const <dynamic>[],
            final Map<String, dynamic> namedArgs = const <String, dynamic>{},
            final List<HTType> typeArgs = const <HTType>[],
          }) =>
              ChapterInfo(
            chapter: namedArgs['chapter'] as String,
            url: namedArgs['url'] as String,
            locale: namedArgs['locale'] as Locale,
            title: namedArgs['title'] as String?,
            volume: namedArgs['volume'] as String?,
          ),
        );

      default:
        throw HTError.undefined(varName);
    }
  }

  @override
  dynamic instanceMemberGet(final dynamic object, final String varName) {
    final ChapterInfo element = object as ChapterInfo;

    switch (varName) {
      case 'chapter':
        return element.chapter;

      case 'url':
        return element.url;

      case 'locale':
        return element.locale;

      case 'title':
        return element.title;

      case 'volume':
        return element.volume;

      case 'toJson':
        return createHTExternalFunction(
          (
            final HTEntity entity, {
            final List<dynamic> positionalArgs = const <dynamic>[],
            final Map<String, dynamic> namedArgs = const <String, dynamic>{},
            final List<HTType> typeArgs = const <HTType>[],
          }) =>
              element.toJson(),
        );

      default:
        throw HTError.undefined(varName);
    }
  }
}
