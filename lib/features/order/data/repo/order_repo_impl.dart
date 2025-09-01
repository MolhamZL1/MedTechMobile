import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medtech_mobile/features/order/data/model/order_model.dart';
import 'package:medtech_mobile/features/order/domain/entities/order_entities.dart';
import 'package:medtech_mobile/features/order/domain/repos/order_repo.dart';


class OrderRepoImpl implements OrderRepo {
  final String baseUrl;

  OrderRepoImpl({required this.baseUrl});

  @override
  Future<List<OrderEntity>> getOrders() async {
    final response = await http.get(Uri.parse('$baseUrl/orders'));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => OrderModel.fromJson(e)).toList();
    } else {
      throw Exception('فشل في جلب الطلبات');
    }
  }
}
