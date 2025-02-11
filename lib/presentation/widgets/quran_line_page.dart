part of '../../quran.dart';

class QuranLinePage extends StatelessWidget {
  final int pageIndex;
  final int? surahNumber;
  final BannerStyle? bannerStyle;
  final SurahNameStyle? surahNameStyle;
  final SurahInfoStyle? surahInfoStyle;
  final Function(SurahNamesModel surah)? onSurahBannerPress;
  final BasmalaStyle? basmalaStyle;
  final Size deviceSize;
  final Function(LongPressStartDetails details, AyahModel ayah)?
      onAyahLongPress;
  final Color? bookmarksColor;
  final Color? textColor;
  final List? bookmarkList;
  final Color? ayahSelectedBackgroundColor;
  final VoidCallback? onPagePress;
  final List<String> newSurahs;
  final String? languageCode;
  final String? juzName;
  final String? sajdaName;
  final Widget? topTitleChild;
  
  QuranLinePage(
      {super.key,
      required this.pageIndex,
      this.surahNumber,
      this.bannerStyle,
      this.surahNameStyle,
      this.surahInfoStyle,
      this.onSurahBannerPress,
      this.basmalaStyle,
      required this.deviceSize,
      this.onAyahLongPress,
      this.bookmarksColor,
      this.textColor,
      this.bookmarkList,
      this.ayahSelectedBackgroundColor,
      this.onPagePress,
      required this.newSurahs,
      this.languageCode,
      this.juzName,
      this.sajdaName,
      this.topTitleChild});

  final quranCtrl = QuranCtrl.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      padding: EdgeInsets.symmetric(
          horizontal: context.currentOrientation(16.0, 64.0), vertical: 6.0),
      child: pageIndex == 0 || pageIndex == 1

          /// This is for first 2 pages of Quran: Al-Fatihah and Al-Baqarah
          ? towFirstSurahs(context)
          : otherSurahs(context),
    );
  }

  Widget towFirstSurahs(BuildContext context) {
    return AllQuranWidget(
      textColor: textColor,
        pageIndex: pageIndex,
        languageCode: languageCode,
        juzName: juzName,
        sajdaName: sajdaName,
        isRight: pageIndex.isEven ? true : false,
        topTitleChild: topTitleChild,
        child: Container(
            height: MediaQuery.sizeOf(context).height * .63,
            padding: EdgeInsets.symmetric(
                vertical: context.currentOrientation(
                    MediaQuery.sizeOf(context).width * .16,
                    MediaQuery.sizeOf(context).height * .01)),
            child: SingleChildScrollView(
                physics: context.currentOrientation(
                    const NeverScrollableScrollPhysics(), null),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SurahHeaderWidget(
                      surahNumber ??
                          quranCtrl.staticPages[pageIndex].ayahs[0].surahNumber,
                      bannerStyle: bannerStyle ??
                          BannerStyle(
                            isImage: false,
                            bannerSvgPath: AssetsPath().surahSvgBanner,
                            bannerSvgHeight: 40.0,
                            bannerSvgWidth: 150.0,
                            bannerImagePath: '',
                            bannerImageHeight: 50,
                            bannerImageWidth: double.infinity,
                          ),
                      surahNameStyle: surahNameStyle ??
                          SurahNameStyle(
                            surahNameWidth: 70,
                            surahNameHeight: 37,
                            surahNameColor: Colors.black,
                          ),
                      surahInfoStyle: surahInfoStyle ??
                          SurahInfoStyle(
                            ayahCount: 'عدد الآيات',
                            secondTabText: 'عن السورة',
                            firstTabText: 'أسماء السورة',
                            backgroundColor: Colors.white,
                            closeIconColor: Colors.black,
                            indicatorColor: Colors.amber.withValues(alpha: .2),
                            primaryColor: Colors.amber.withValues(alpha: .2),
                            surahNameColor: Colors.black,
                            surahNumberColor: Colors.black,
                            textColor: Colors.black,
                            titleColor: Colors.black,
                          ),
                      onSurahBannerPress: onSurahBannerPress,
                    ),
                    if (pageIndex == 1)
                      BasmallahWidget(
                        surahNumber: quranCtrl
                            .staticPages[pageIndex].ayahs[0].surahNumber,
                        basmalaStyle: basmalaStyle ??
                            BasmalaStyle(
                              basmalaColor: Colors.black,
                              basmalaWidth: 150.0,
                              basmalaHeight: 30.0,
                            ),
                      ),
                    ...quranCtrl.staticPages[pageIndex].lines.map((line) {
                      return GetBuilder<BookmarksCtrl>(
                        builder: (bookmarkCtrl) {
                          return Column(
                            children: [
                              SizedBox(
                                  width: deviceSize.width - 32,
                                  child: QuranLine(
                                    line,
                                    bookmarkCtrl.bookmarksAyahs,
                                    bookmarkCtrl.bookmarks,
                                    boxFit: BoxFit.scaleDown,
                                    onDefaultAyahLongPress: onAyahLongPress,
                                    bookmarksColor: bookmarksColor,
                                    textColor: textColor,
                                    bookmarkList: bookmarkList,
                                    pageIndex: pageIndex,
                                    ayahSelectedBackgroundColor:
                                        ayahSelectedBackgroundColor,
                                    onPagePress: onPagePress,
                                  )),
                            ],
                          );
                        },
                      );
                    }),
                  ],
                ))));
  }

  Widget otherSurahs(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return AllQuranWidget(
        textColor:textColor ,
        pageIndex: pageIndex,
        isRight: pageIndex.isEven ? true : false,
        languageCode: languageCode,
        juzName: juzName,
        sajdaName: sajdaName,
        topTitleChild: topTitleChild,
        child: SingleChildScrollView(
          physics: context.currentOrientation(
              const NeverScrollableScrollPhysics(), null),
          child: Column(
            children: [
              ...quranCtrl.staticPages[pageIndex].lines.map((line) {
                bool firstAyah = false;
                if (line.ayahs[0].ayahNumber == 1 &&
                    !newSurahs.contains(line.ayahs[0].arabicName)) {
                  newSurahs.add(line.ayahs[0].arabicName);
                  firstAyah = true;
                }
                return GetBuilder<BookmarksCtrl>(
                  builder: (bookmarkCtrl) {
                    return Column(
                      children: [
                        if (firstAyah)
                          SurahHeaderWidget(
                            surahNumber ?? line.ayahs[0].surahNumber,
                            bannerStyle: bannerStyle ??
                                BannerStyle(
                                  isImage: false,
                                  bannerSvgPath: AssetsPath().surahSvgBanner,
                                  bannerSvgHeight: 40.0,
                                  bannerSvgWidth: 150.0,
                                  bannerImagePath: '',
                                  bannerImageHeight: 50,
                                  bannerImageWidth: double.infinity,
                                ),
                            surahNameStyle: surahNameStyle ??
                                SurahNameStyle(
                                  surahNameWidth: 70,
                                  surahNameHeight: 37,
                                  surahNameColor: Colors.black,
                                ),
                            surahInfoStyle: surahInfoStyle ??
                                SurahInfoStyle(
                                  ayahCount: 'عدد الآيات',
                                  secondTabText: 'عن السورة',
                                  firstTabText: 'أسماء السورة',
                                  backgroundColor: Colors.white,
                                  closeIconColor: Colors.black,
                                  indicatorColor:
                                      Colors.amber.withValues(alpha: .2),
                                  primaryColor:
                                      Colors.amber.withValues(alpha: .2),
                                  surahNameColor: Colors.black,
                                  surahNumberColor: Colors.black,
                                  textColor: Colors.black,
                                  titleColor: Colors.black,
                                ),
                            onSurahBannerPress: onSurahBannerPress,
                          ),
                        if (firstAyah && (line.ayahs[0].surahNumber != 9))
                          BasmallahWidget(
                            surahNumber: quranCtrl
                                .staticPages[pageIndex].ayahs[0].surahNumber,
                            basmalaStyle: basmalaStyle ??
                                BasmalaStyle(
                                  basmalaColor: Colors.black,
                                  basmalaWidth: 150.0,
                                  basmalaHeight: 30.0,
                                ),
                          ),
                        SizedBox(
                          width: deviceSize.width - 30,
                          height: (context.currentOrientation(
                                      constraints.maxHeight * .94,
                                      MediaQuery.sizeOf(context).width) -
                                  (quranCtrl.staticPages[pageIndex]
                                          .numberOfNewSurahs *
                                      (line.ayahs[0].surahNumber != 9
                                          ? 110
                                          : 80))) *
                              0.95 /
                              quranCtrl.staticPages[pageIndex].lines.length,
                          child: QuranLine(
                            line,
                            bookmarkCtrl.bookmarksAyahs,
                            bookmarkCtrl.bookmarks,
                            boxFit: line.ayahs.last.centered
                                ? BoxFit.scaleDown
                                : BoxFit.fill,
                            onDefaultAyahLongPress: onAyahLongPress,
                            bookmarksColor: bookmarksColor,
                            textColor: textColor,
                            bookmarkList: bookmarkList,
                            pageIndex: pageIndex,
                            ayahSelectedBackgroundColor:
                                ayahSelectedBackgroundColor,
                            onPagePress: onPagePress,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }),
            ],
          ),
        ),
      );
    });
  }
}
