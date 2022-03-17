import 'package:hive/hive.dart';

part 'sneakers_viewed_db.g.dart';

@HiveType(typeId: 0)
class SneakersViewed extends HiveObject{
  SneakersViewed({
    required this.id,
    required this.dateTimeViewed
  });

  @HiveField(0)
  final int id;

  @HiveField(1)
  DateTime dateTimeViewed;
}