part of '../../../../quran.dart';

TextSpan span({
  required String text,
  required int pageIndex,
  required bool isSelected,
  double? fontSize,
  required int surahNum,
  required int ayahNum,
  required int ayahUQNum,
  LongPressStartDetailsFunction? onLongPressStart,
  required bool isFirstAyah,
  required List? bookmarkList,
  required Color? textColor,
  required Map<int, List<BookmarkModel>> bookmarks,
  required List<int> bookmarksAyahs,
  Color? bookmarksColor,
  Color? ayahSelectedBackgroundColor,
}) {
  // if (bookmarkList!.isEmpty) {
  //   bookmarkList = bookmarks as List<BookmarkModel>;
  // }
  if (text.isNotEmpty) {
    final String partOne = text.length < 3 ? text[0] : text[0] + text[1];
    // final String partOne = pageIndex == 250
    //     ? text.length < 3
    //         ? text[0]
    //         : text[0] + text[1]
    //     : text.length < 3
    //         ? text[0]
    //         : text[0] + text[1];
    final String? partTwo =
        text.length > 2 ? text.substring(2, text.length - 1) : null;
    final String initialPart = text.substring(0, text.length - 1);
    final String lastCharacter =
        ayahNum.toString().convertEnglishNumbersToArabic(ayahNum.toString()) +
            ' '; //text.substring(text.length - 1);
    final allBookmarks = bookmarks.values.expand((list) => list).toList();
    final bookmarkCtrl = BookmarksCtrl.instance;
    final quranCtrl = QuranCtrl.instance;
    TextSpan? first;
    TextSpan? second;
    if (isFirstAyah) {
      first = TextSpan(
        text: partOne,
        style: TextStyle(
          fontFamily: 'p${(pageIndex + 1)}',
          fontSize: fontSize,
          height: 2,
          letterSpacing: 30,
          color: quranCtrl.state.fontsSelected2.value == 1
              ? textColor ?? Colors.transparent
              : null,
          backgroundColor:
              bookmarkCtrl.hasBookmark(surahNum, ayahUQNum, bookmarkList).value
                  ? bookmarksColor
                  : (bookmarksAyahs.contains(ayahUQNum)
                      ? Color(allBookmarks
                              .firstWhere(
                                (b) => b.ayahId == ayahUQNum,
                              )
                              .colorCode)
                          .withValues(alpha: 0.7)
                      : isSelected
                          ? ayahSelectedBackgroundColor ??
                              const Color(0xffCDAD80).withValues(alpha: 0.25)
                          : null),
        ),
        recognizer: LongPressGestureRecognizer(
            duration: const Duration(milliseconds: 500))
          ..onLongPressStart = onLongPressStart,
      );
      second = TextSpan(
        text: partTwo,
        style: TextStyle(
          fontFamily: 'p${(pageIndex + 1)}',
          fontSize: fontSize,
          height: 2,
          letterSpacing: 5,
          // wordSpacing: wordSpacing + 10,
          color: quranCtrl.state.fontsSelected2.value == 1
              ? textColor ?? Colors.transparent
              : null,
          backgroundColor:
              bookmarkCtrl.hasBookmark(surahNum, ayahUQNum, bookmarkList).value
                  ? bookmarksColor
                  : (bookmarksAyahs.contains(ayahUQNum)
                      ? Color(allBookmarks
                              .firstWhere(
                                (b) => b.ayahId == ayahUQNum,
                              )
                              .colorCode)
                          .withValues(alpha: 0.7)
                      : isSelected
                          ? ayahSelectedBackgroundColor ??
                              const Color(0xffCDAD80).withValues(alpha: 0.25)
                          : null),
        ),
        recognizer: LongPressGestureRecognizer(
            duration: const Duration(milliseconds: 500))
          ..onLongPressStart = onLongPressStart,
      );
    }

    final TextSpan initialTextSpan = TextSpan(
      text: initialPart,
      style: TextStyle(
        fontFamily: 'p${(pageIndex + 1)}',
        fontSize: fontSize,
        height: 2,
        letterSpacing: 5,
        color: quranCtrl.state.fontsSelected2.value == 1
            ? textColor ?? Colors.transparent
            : null,
        backgroundColor:
            bookmarkCtrl.hasBookmark(surahNum, ayahUQNum, bookmarkList).value
                ? bookmarksColor
                : (bookmarksAyahs.contains(ayahUQNum)
                    ? Color(allBookmarks
                            .firstWhere(
                              (b) => b.ayahId == ayahUQNum,
                            )
                            .colorCode)
                        .withValues(alpha: 0.7)
                    : isSelected
                        ? ayahSelectedBackgroundColor ??
                            const Color(0xffCDAD80).withValues(alpha: 0.25)
                        : null),
      ),
      recognizer: LongPressGestureRecognizer(
          duration: const Duration(milliseconds: 500))
        ..onLongPressStart = onLongPressStart,
    );

    var lastCharacterSpan = bookmarkCtrl
                .hasBookmark(surahNum, ayahUQNum, bookmarkList)
                .value ||
            bookmarksAyahs.contains(ayahUQNum)
        ? WidgetSpan(
            child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
            child: SvgPicture.asset(
              AssetsPath().ayahBookmarked,
              height: 100,
            ),
          ))
        : TextSpan(
            text: lastCharacter,
            style: TextStyle(
              fontFamily: 'hafs',
              fontSize: fontSize,
              height: 2,
              letterSpacing: 5,
              package: 'quran_library',
              color: bookmarkCtrl
                      .hasBookmark(surahNum, ayahUQNum, bookmarkList)
                      .value
                  ? textColor ?? Colors.transparent
                  : const Color(0xff77554B),
              backgroundColor: bookmarkCtrl
                      .hasBookmark(surahNum, ayahUQNum, bookmarkList)
                      .value
                  ? bookmarksColor
                  : (bookmarksAyahs.contains(ayahUQNum)
                      ? Color(allBookmarks
                              .firstWhere(
                                (b) => b.ayahId == ayahUQNum,
                              )
                              .colorCode)
                          .withValues(alpha: 0.7)
                      : isSelected
                          ? ayahSelectedBackgroundColor ??
                              const Color(0xffCDAD80).withValues(alpha: 0.25)
                          : null),
            ),
            recognizer: LongPressGestureRecognizer(
                duration: const Duration(milliseconds: 500))
              ..onLongPressStart = onLongPressStart,
          );

    return TextSpan(
      children: isFirstAyah
          ? [first!, second!, lastCharacterSpan]
          : [initialTextSpan, lastCharacterSpan],
      recognizer: LongPressGestureRecognizer(
          duration: const Duration(milliseconds: 500))
        ..onLongPressStart = onLongPressStart,
    );
  } else {
    return const TextSpan(text: '');
  }
}

TextSpan customSpan({
  required String text,
  required int pageIndex,
  required bool isSelected,
  double? fontSize,
  required int surahNum,
  required int ayahUQNum,
  required int ayahNumber,
  LongPressStartDetailsFunction? onLongPressStart,
  required bool isFirstAyah,
  required List? bookmarkList,
  required Color? textColor,
  required Map<int, List<BookmarkModel>> bookmarks,
  required List<int> bookmarksAyahs,
  Color? bookmarksColor,
  Color? ayahSelectedBackgroundColor,
  String? languageCode,
}) {
  final allBookmarks = bookmarks.values.expand((list) => list).toList();
  final bookmarkCtrl = BookmarksCtrl.instance;
  if (text.isNotEmpty) {
    return TextSpan(
      children: [
        TextSpan(
          text: text,
          style: TextStyle(
            fontFamily: 'hafs',
            fontSize: fontSize,
            height: 2,
            color: textColor ?? Colors.black,
            backgroundColor: bookmarkCtrl
                    .hasBookmark(surahNum, ayahUQNum, bookmarkList)
                    .value
                ? bookmarksColor
                : (bookmarksAyahs.contains(ayahUQNum)
                    ? Color(allBookmarks
                            .firstWhere(
                              (b) => b.ayahId == ayahUQNum,
                            )
                            .colorCode)
                        .withValues(alpha: 0.7)
                    : isSelected
                        ? ayahSelectedBackgroundColor ??
                            const Color(0xffCDAD80).withValues(alpha: 0.25)
                        : null),
            package: "quran_library",
          ),
          recognizer: LongPressGestureRecognizer(
              duration: const Duration(milliseconds: 500))
            ..onLongPressStart = onLongPressStart,
        ),
        bookmarkCtrl.hasBookmark(surahNum, ayahUQNum, bookmarkList).value
            ? WidgetSpan(
                child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
                child: SvgPicture.asset(
                  AssetsPath().ayahBookmarked,
                  height: 35,
                ),
              ))
            : TextSpan(
                text: ayahNumber
                    .toString()
                    .convertNumbersAccordingToLang(languageCode: languageCode),
                style: TextStyle(
                  fontFamily: 'hafs',
                  fontSize: fontSize,
                  height: 2,
                  color: bookmarkCtrl
                          .hasBookmark(surahNum, ayahUQNum, bookmarkList)
                          .value
                      ? textColor ?? Colors.black
                      : const Color(0xff77554B),
                  backgroundColor: bookmarkCtrl
                          .hasBookmark(surahNum, ayahUQNum, bookmarkList)
                          .value
                      ? bookmarksColor
                      : (bookmarksAyahs.contains(ayahUQNum)
                          ? Color(allBookmarks
                                  .firstWhere(
                                    (b) => b.ayahId == ayahUQNum,
                                  )
                                  .colorCode)
                              .withValues(alpha: 0.7)
                          : isSelected
                              ? ayahSelectedBackgroundColor ??
                                  const Color(0xffCDAD80)
                                      .withValues(alpha: 0.25)
                              : null),
                  package: "quran_library",
                ),
                recognizer: LongPressGestureRecognizer(
                    duration: const Duration(milliseconds: 500))
                  ..onLongPressStart = onLongPressStart,
              ),
      ],
      recognizer: LongPressGestureRecognizer(
          duration: const Duration(milliseconds: 500))
        ..onLongPressStart = onLongPressStart,
    );
  } else {
    return const TextSpan(text: '');
  }
}

typedef LongPressStartDetailsFunction = void Function(LongPressStartDetails)?;
