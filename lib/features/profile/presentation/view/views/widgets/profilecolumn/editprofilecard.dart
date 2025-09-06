import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/features/profile/presentation/cubit/cubit/profile_cubit.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/editprofile/editprofile.dart';

class Editprofilecard extends StatelessWidget {
  const Editprofilecard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
          final cubit = context.read<ProfileCubit>(); 
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => Editprofile(cubit: cubit),
  ),
).then((updated) {
  if (updated == true) {
    cubit.fetchProfile();
  }
});

      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(
                    0.1,
                  ), 
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.message, 
                    color: Colors.blue, 
                    size: 24,
                  ),
                ),
              ),
      
              SizedBox(width: 10),
              Text("تعديل الملف الشخصي "),
         const Spacer(),
              IconButton(onPressed: () {  },
              icon: Icon(Icons.arrow_drop_down),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
