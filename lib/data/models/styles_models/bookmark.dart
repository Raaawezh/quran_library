part of '../../../quran.dart';

class BookmarkModel {
  final int id;
  final int colorCode;
  final int ayahId;
  final int surahId;
  final String ayatText;
  int ayahNumber;
  int page;
  final String name;

  BookmarkModel({
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
        'ayahNumber': ayahNumber,
        'page': page,
        'color': colorCode,
        'name': name,
      };

  factory BookmarkModel.fromJson(Map<String, dynamic> json) => BookmarkModel(
        id: json['id'],
        surahId: json['surahId'],
        colorCode: json['color'],
        ayatText: json['ayatText'] as String? ?? "",
        name: json['name'] ?? 'Unnamed Bookmark',
        ayahId: json['ayahId'] ?? -1,
        ayahNumber: json['ayahNumber'] ?? -1,
        page: json['page'] ?? -1,
      );
}
