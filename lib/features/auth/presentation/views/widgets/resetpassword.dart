import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';
import 'package:medtech_mobile/features/auth/presentation/views/widgets/items/customappbar.dart';
import 'package:medtech_mobile/features/auth/presentation/views/widgets/items/custombuttom.dart';
import 'package:medtech_mobile/features/auth/presentation/views/widgets/items/customform.dart';

class Resetpassword extends StatefulWidget {
  const Resetpassword({super.key});

  @override
  State<Resetpassword> createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
  GlobalKey<FormState> reskey = GlobalKey();
  TextEditingController newpass = TextEditingController();
  TextEditingController confirmpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(),
      body: SingleChildScrollView(
        child: Form(
          key: reskey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 150),
            child: Column(
              children: [
                customform(
                  hint: 'Enter New Password',
                  mycontroller: newpass,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return '8 symbols at least';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 15),
                customform(
                  hint: 'Confirm Password',
                  mycontroller: newpass,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return '8 symbols at least';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 50),
                Custombuttom(
                  onPressed: () {
                    if (reskey.currentState!.validate()) {}
                  },
                  text: 'Submit',
                  BColor: AppColors.primaryColor,
                  Tcolor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
