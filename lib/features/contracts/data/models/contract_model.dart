import 'package:medtech_mobile/core/utils/backend_endpoints.dart';
import 'package:medtech_mobile/features/contracts/domain/entity/contract_entity.dart';
import 'package:medtech_mobile/features/order/data/model/order_model.dart';

class ContractModel {
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

  ContractModel({
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

  factory ContractModel.fromJson(Map<String, dynamic> json) {
    return ContractModel(
      id: json['id'],
      contractNumber: json['contractNumber'],
      orderItemId: json['orderItemId'],
      productId: json['productId'],
      status: json['status'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      conditionOnDispatch: json['conditionOnDispatch'],
      conditionOnReturn: json['conditionOnReturn'],
      actualReturnDate:
          json['actualReturnDate'] != null
              ? DateTime.parse(json['actualReturnDate'])
              : null,
      agreedToTermsAt: DateTime.parse(json['agreedToTermsAt']),
      contractDocumentUrl: json['contractDocumentUrl'],
      notes: json['notes'],
      productName: json["product"]['nameEn'],
      productImage: BackendEndpoints.url + json["product"]['images'][0],
    );
  }

  ContractEntity toEntity() {
    return ContractEntity(
      id: id,
      contractNumber: contractNumber,
      orderItemId: orderItemId,
      productId: productId,
      status: status,
      startDate: startDate,
      endDate: endDate,
      conditionOnDispatch: conditionOnDispatch,
      conditionOnReturn: conditionOnReturn,
      actualReturnDate: actualReturnDate,
      agreedToTermsAt: agreedToTermsAt,
      contractDocumentUrl: contractDocumentUrl,
      notes: notes,
      productName: productName,
      productImage: productImage,
    );
  }
}
