import '../../../order/data/model/order_model.dart';

class ContractEntity {
  final int id;
  final String contractNumber;
  final int orderItemId;
  final int productId;
  final String status;
  final DateTime startDate;
  final DateTime endDate;
  final String? conditionOnDispatch;
  final String? conditionOnReturn;
  final DateTime? actualReturnDate;
  final DateTime agreedToTermsAt;
  final String contractDocumentUrl;
  final String? notes;
  final String productName;
  final String productImage;

  ContractEntity({
    required this.id,
    required this.contractNumber,
    required this.orderItemId,
    required this.productId,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.conditionOnDispatch,
    required this.conditionOnReturn,
    required this.actualReturnDate,
    required this.agreedToTermsAt,
    required this.contractDocumentUrl,
    required this.notes,
    required this.productName,
    required this.productImage,
  });
}
