part of '../../../quran.dart';

class BookmarkModel {
  final int id;
  final int colorCode;
  final int ayahId;
  final int surahId;
  final String ayatText;
  int ayahNumber;
  int page;
  final DateTime? dateTime;
  final String name;

  BookmarkModel({
    required this.dateTime,
    required this.surahId,
    required this.ayatText,
    required this.id,
    required this.colorCode,
    required this.name,
    this.ayahId = -1,
    this.ayahNumber = -1,
    this.page = -1,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'ayahId': ayahId,
        "surahId": surahId,
        "dateTime": dateTime.toString(),
        'ayatText': ayatText,
        'ayahNumber': ayahNumber,
        'page': page,
        'color': colorCode,
        'name': name,
      };

  factory BookmarkModel.fromJson(Map<String, dynamic> json) => BookmarkModel(
        id: json['id'] as int? ?? 0,
        surahId: json['surahId'] as int? ?? 0,
        dateTime: (json["dateTime"] as String?) == null
            ? null
            : DateTime.parse(json['dateTime'] as String? ?? ""),
        colorCode: json['color'] as int? ?? 0,
        ayatText: json['ayatText'] as String? ?? "--",
        name: json['name'] as String? ?? 'Unnamed Bookmark',
        ayahId: json['ayahId'] as int? ?? -1,
        ayahNumber: json['ayahNumber'] as int? ?? -1,
        page: json['page'] as int? ?? -1,
      );
}
