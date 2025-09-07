import 'package:animated_react_button/animated_react_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/features/favorites/presentation/cubits/add/addto_favorite_cubit.dart';

class CustomFavoriteButton extends StatefulWidget {
  const CustomFavoriteButton({
    super.key,
    required this.id,
    required this.isFavorite,
  });
  final String id;
  final bool isFavorite;

  @override
  State<CustomFavoriteButton> createState() => _CustomFavoriteButtonState();
}

class _CustomFavoriteButtonState extends State<CustomFavoriteButton> {
  late bool isFavorite;
  @override
  void initState() {
    isFavorite = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedReactButton(
      reactColor: Colors.red,
      isFavorite: isFavorite,
      onPressed: () {
        isFavorite = !isFavorite;
        setState(() {});
        context.read<AddtoFavoriteCubit>().addToFavorite(id: widget.id);
      },
    );
  }
}
