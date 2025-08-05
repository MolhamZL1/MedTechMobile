import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';
import 'package:medtech_mobile/core/widgets/show_err_dialog.dart';
import 'package:medtech_mobile/features/cart/presentation/cubits/update_cart/update_cart_cubit.dart';

class Addtocartbutton extends StatelessWidget {
  const Addtocartbutton({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      color: AppColors.primary,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),

        onTap: () {
          context.read<UpdateCartCubit>().updateCart(id: id, qty: 1);
        },
        child: Container(
          padding: EdgeInsets.all(17),

          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: BlocConsumer<UpdateCartCubit, UpdateCartState>(
            listener: (context, state) {
              if (state is UpdateCartSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Added to cart successfully"),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (state is UpdateCartError) {
                showerrorDialog(
                  context: context,
                  title: "Can not add to cart",
                  description: state.message,
                );
              }
            },
            builder: (context, state) {
              if (state is UpdateCartLoading) {
                return CircularProgressIndicator(color: Colors.white);
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Add to Cart", style: TextStyle(color: Colors.white)),
                  SizedBox(width: 10),
                  Icon(FontAwesomeIcons.cartShopping, color: Colors.white),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
