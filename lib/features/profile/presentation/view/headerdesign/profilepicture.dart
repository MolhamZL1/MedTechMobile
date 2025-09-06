// import 'dart:typed_data';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:medtech_mobile/core/utils/app_images.dart';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// import 'package:medtech_mobile/features/profile/presentation/cubit/profile_cubit.dart';

// class Profilepicture extends StatefulWidget {
//   final IconData icon;
//   final String? imageUrl;

//   const Profilepicture({
//     super.key,
//     required this.icon,
//     this.imageUrl,
//   });

//   @override
//   State<Profilepicture> createState() => _ProfilepictureState();
// }

// class _ProfilepictureState extends State<Profilepicture> {
//   File? _pickedImage;
// Uint8List? _webImage;



// Future<void> _pickImage() async {
//   final picker = ImagePicker();
//   final picked = await picker.pickImage(source: ImageSource.gallery);

//   if (picked != null) {
//     final cubit = context.read<ProfileCubit>();

//     if (kIsWeb) {
//       final bytes = await picked.readAsBytes();
//       setState(() {
//         _webImage = bytes;
//       });
//       cubit.webPickedImage = bytes;
//     } else {
//       setState(() {
//         _pickedImage = File(picked.path);
//       });
//       cubit.pickedImage = _pickedImage;
//     }
//   }
// }



//   @override
//   Widget build(BuildContext context) {
//     ImageProvider? bgImage;

//     if (_pickedImage != null) {
//       bgImage = FileImage(_pickedImage!);
//     }else if (_webImage != null) {
//       bgImage = MemoryImage(_webImage!);
//     } else if (widget.imageUrl != null) {
//       bgImage = NetworkImage(widget.imageUrl!);
//     } 
    
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: Center(
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundColor: Colors.blue.shade100,
//         backgroundImage:bgImage,

//             ),
//             Positioned(
//               bottom: 0,
//               right: 0,
//               child: GestureDetector(
//                 onTap: _pickImage,
//                 child: Container(
//                   padding: const EdgeInsets.all(6),
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.white, width: 2),
//                   ),
//                   child: Icon(
//                     widget.icon,
//                     size: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/features/profile/presentation/cubit/cubit/profile_state.dart';
import 'package:medtech_mobile/features/profile/presentation/cubit/cubit/profile_cubit.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medtech_mobile/features/profile/presentation/cubit/cubit/profile_cubit.dart';

class Profilepicture extends StatefulWidget {
  final IconData icon;

  const Profilepicture({
    super.key,
    required this.icon,
  });

  @override
  State<Profilepicture> createState() => _ProfilepictureState();
}

class _ProfilepictureState extends State<Profilepicture> {
  File? _pickedImage;
  Uint8List? _webImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      final cubit = context.read<ProfileCubit>();

      if (kIsWeb) {
        final bytes = await picked.readAsBytes();
        setState(() {
          _webImage = bytes;
        });
        cubit.webPickedImage = bytes;
      } else {
        setState(() {
          _pickedImage = File(picked.path);
        });
        cubit.pickedImage = _pickedImage;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        ImageProvider? bgImage;

        if (_pickedImage != null) {
          bgImage = FileImage(_pickedImage!);
        } else if (_webImage != null) {
          bgImage = MemoryImage(_webImage!);
        } else if (state is ProfileLoaded &&
            state.profile.image != null &&
            state.profile.image!.isNotEmpty) {
          bgImage = NetworkImage(state.profile.image!);
        }

        if (state is ProfileLoading) {
          return const CircularProgressIndicator();
        }

        return Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue.shade100,
                  backgroundImage: bgImage,
                  child: bgImage == null
                      ? const Icon(Icons.person, size: 40, color: Colors.white)
                      : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Icon(
                        widget.icon, // 👈 الايقونة من البراميتر
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
