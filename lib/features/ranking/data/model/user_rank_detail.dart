class UserRankDetail {
  final String name;
  final int point;
  final int lastPoint;
  final String level;
  final String statusLevel;
  final int changePoint;

  UserRankDetail({
    required this.name,
    required this.point,
    required this.lastPoint,
    required this.level,
    required this.statusLevel,
  }) : changePoint = point - lastPoint;
}
