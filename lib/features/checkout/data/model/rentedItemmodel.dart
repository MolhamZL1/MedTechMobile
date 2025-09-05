class Renteditemmodel {
  final String startDate;
  final String endDate;
  final String productId;

  Renteditemmodel({
    required this.startDate,
    required this.endDate,
    required this.productId,
  });

  Map<String, dynamic> toJson() => {
    'startDate': startDate,
    'endDate': endDate,
    'cartItemId': productId,
  };
  factory Renteditemmodel.fromSelection({
    required String cartItemId,
    required DateTime startUtc,
    required DateTime endUtc,
  }) {
    return Renteditemmodel(
      productId: cartItemId,
      startDate: startUtc.toUtc().toIso8601String(),
      endDate: endUtc.toUtc().toIso8601String(),
    );
  }
}
