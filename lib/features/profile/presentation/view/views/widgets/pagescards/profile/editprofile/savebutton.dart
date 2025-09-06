import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';
import 'package:medtech_mobile/features/profile/domain/entites/edit_profile_entity.dart';
import 'package:medtech_mobile/features/profile/presentation/cubit/cubit/profile_cubit.dart';

class Savebutton extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController numberController;
  final TextEditingController locationController;
   final ProfileCubit cubit;

  const Savebutton({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.numberController,
    required this.locationController, required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      color: AppColors.primary,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
      onTap: () async {
  final profile = UpdateProfileEntity(
    username: nameController.text,
    email: emailController.text,
    number: numberController.text,
    // location: locationController.text,
  );

  await cubit.updateProfile(profile, imageFile: cubit.pickedImage ?? cubit.webPickedImage);

  if (context.mounted) {
    Navigator.pop(context, true);
  }
},




        child: Container(
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "حفظ التغييرات",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
