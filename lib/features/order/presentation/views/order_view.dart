import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/services/get_it_service.dart';
import 'package:medtech_mobile/features/auth/data/models/user_model.dart';
import 'package:medtech_mobile/features/order/domain/repos/order_repo.dart';
import 'package:medtech_mobile/features/order/presentation/cubits/order/order_cubit.dart';
import 'package:medtech_mobile/features/order/presentation/views/widgets/order_view_body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  String? _userId; // صارت قابلة لأن تكون null

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString("user");
      if (raw != null) {
        final user = UserModel.fromJson(jsonDecode(raw));
        if (!mounted) return;
        setState(() {
          _userId = user.id;
        });
      } else {
        // مافي يوزر مخزّن: ممكن تعرض رسالة/توجّه لتسجيل الدخول
        if (!mounted) return;
        setState(() {
          _userId = null;
        });
      }
    } catch (e) {
      // معالجة أي خطأ بالقراءة/التحويل
      if (!mounted) return;
      setState(() {
        _userId = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // لسه ما جبت الـ id: اعرض لودينغ بسيط
    if (_userId == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // بعد ما يصير _userId جاهز: بنبني الـ Bloc ونجلب الطلبات
    return BlocProvider(
      create:
          (context) =>
              OrderCubit(getIt.get<OrderRepo>())..fetchOrders(id: _userId!),
      child: const OrderViewBody(),
    );
  }
}
