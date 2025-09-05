import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/features/checkout/data/model/rentedItemmodel.dart';
import '../../../data/model/RentalPeriod.dart';

/// أداة مساعدة: تطبيع التاريخ إلى منتصف الليل UTC
DateTime _normalizeUtcMidnight(DateTime dt) =>
    DateTime.utc(dt.year, dt.month, dt.day);

class RentalSelectionState extends Equatable {
  /// key = cartItemId
  final Map<num, RentalPeriod> selections;
  const RentalSelectionState({this.selections = const {}});

  @override
  List<Object?> get props => [selections];

  /// عدد الأيام (0 إذا غير صالح/غير موجود)
  int daysFor(num cartItemId) {
    final p = selections[cartItemId];
    if (p == null) return 0;
    final start = _normalizeUtcMidnight(p.start.toUtc());
    final end = _normalizeUtcMidnight(p.end.toUtc());
    final diff = end.difference(start).inDays;
    return diff > 0 ? diff : 0; // نهاية يجب أن تكون بعد البداية
  }

  /// يحوّل الاختيارات إلى List<Renteditemmodel> للـ API:
  /// [{"cartItemId": 41, "startDate": "...Z", "endDate": "...Z"}, ...]
  List<Renteditemmodel> toRentedItemsList() {
    final list =
        selections.entries.map((e) {
          final cartItemId = e.key;
          final period = e.value;

          final startUtc = _normalizeUtcMidnight(period.start.toUtc());
          final endUtc = _normalizeUtcMidnight(period.end.toUtc());

          return Renteditemmodel(
            // ملاحظة: موديلك يسمّيها productId لكن toJson يُخرج "cartItemId"
            // لذلك نمرر القيمة هنا، والـ toJson يتكفّل بالمفتاح الصحيح.
            productId: cartItemId.toString(),
            startDate: startUtc.toIso8601String(), // "YYYY-MM-DDTHH:mm:ss.mmmZ"
            endDate: endUtc.toIso8601String(),
          );
        }).toList();

    // (اختياري) ترتيب بالمعرّف
    list.sort((a, b) => a.productId.compareTo(b.productId));
    return list;
  }

  /// (اختياري) تحقّق صارم قبل الإرسال: يرمي استثناء عند أي خطأ
  void validateOrThrow() {
    for (final e in selections.entries) {
      final start = _normalizeUtcMidnight(e.value.start.toUtc());
      final end = _normalizeUtcMidnight(e.value.end.toUtc());
      if (!end.isAfter(start)) {
        throw ArgumentError(
          'End date must be after start date for cartItemId=${e.key}.',
        );
      }
    }
  }
}

class RentalSelectionCubit extends Cubit<RentalSelectionState> {
  RentalSelectionCubit() : super(const RentalSelectionState());

  /// cartItemId = نفس الـ id تبع CartItem بالباك إند (مهم للتطابق)
  void setPeriod(num cartItemId, RentalPeriod period) {
    final normalized = RentalPeriod(
      start: _normalizeUtcMidnight(period.start.toUtc()),
      end: _normalizeUtcMidnight(period.end.toUtc()),
    );
    final m = Map<num, RentalPeriod>.from(state.selections);
    m[cartItemId] = normalized;
    emit(RentalSelectionState(selections: m));
  }

  /// إدخال تواريخ محليّة من الواجهة ثم حفظها UTC منتصف الليل
  void setPeriodFromLocalDays(
    num cartItemId,
    DateTime startLocal,
    DateTime endLocal,
  ) {
    final startUtc = _normalizeUtcMidnight(startLocal.toUtc());
    final endUtc = _normalizeUtcMidnight(endLocal.toUtc());
    setPeriod(cartItemId, RentalPeriod(start: startUtc, end: endUtc));
  }

  void clear(num cartItemId) {
    if (!state.selections.containsKey(cartItemId)) return;
    final m = Map<num, RentalPeriod>.from(state.selections);
    m.remove(cartItemId);
    emit(RentalSelectionState(selections: m));
  }

  void clearAll() {
    emit(const RentalSelectionState(selections: {}));
  }
}
