import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/services/get_it_service.dart';
import 'package:medtech_mobile/features/profile/domain/repo/profile_repo.dart';
import 'package:medtech_mobile/features/profile/presentation/cubit/cubit/profile_state.dart';
import 'package:medtech_mobile/features/profile/presentation/cubit/cubit/profile_cubit.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/editprofile/clickforedittext.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/editprofile/customtextfield.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/editprofile/editprofileappbar.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/editprofile/emailsection.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/editprofile/locationsection.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/editprofile/namesection.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/editprofile/numbersection.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/editprofile/picturesection.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/editprofile/savebutton.dart';
import 'package:medtech_mobile/features/profile/presentation/view/headerdesign/profilepicture.dart';

class Editprofile extends StatelessWidget {
    final ProfileCubit cubit;
  Editprofile({super.key, required this.cubit});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final locationController = TextEditingController();

  @override
  
  Widget build(BuildContext context) {
 if (cubit.state is ProfileLoaded) {
      final profile = (cubit.state as ProfileLoaded).profile;
      nameController.text = profile.username;
      emailController.text = profile.email;
      numberController.text = profile.number ?? "";
    }
          return Scaffold(
            appBar: customAppBar(
              title: 'تعديل الملف الشخصي',
              icon: Icons.save,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey.shade100,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Picturesection(),
                      Namesection(nameController: nameController),
                     // Emailsection(emailController: emailController),
                      Numbersection(numberController: numberController,),
                         // Locationsection( locationcontroller: locationController,),
                      const SizedBox(height: 15),
                      Savebutton(
                        nameController: nameController,
                        emailController: emailController,
                        numberController: numberController,
                        locationController: locationController,
                        cubit: context.read<ProfileCubit>(), 
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }  }

