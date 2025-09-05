class RentalPeriod {
  final DateTime start;
  final DateTime end;

  const RentalPeriod({required this.start, required this.end});

  Map<String, dynamic> toJson() {
    return {
      "startDate": start.toUtc().toIso8601String(),
      "endDate": end.toUtc().toIso8601String(),
    };
  }

  factory RentalPeriod.fromLocalDays(DateTime startLocal, DateTime endLocal) {
    final s = DateTime.utc(startLocal.year, startLocal.month, startLocal.day);
    final e = DateTime.utc(endLocal.year, endLocal.month, endLocal.day);
    return RentalPeriod(start: s, end: e);
  }
}
