import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';
import 'package:medtech_mobile/core/utils/app_images.dart';
import 'package:medtech_mobile/core/utils/app_text_styles.dart';
import 'package:medtech_mobile/features/auth/presentation/views/widgets/home.dart';
import 'package:medtech_mobile/features/auth/presentation/views/widgets/items/custombuttom.dart';
import 'package:medtech_mobile/features/auth/presentation/views/widgets/items/customdriver.dart';
import 'package:medtech_mobile/features/auth/presentation/views/widgets/items/customform.dart';
import 'package:medtech_mobile/features/auth/presentation/views/widgets/items/customlogoimage.dart';
import 'package:medtech_mobile/features/auth/presentation/views/widgets/items/customtext.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> sk = GlobalKey();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController PassWordcontroller = TextEditingController();
  bool ispassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView(
          children: [
            Form(
              key: sk,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Customlogoimage(),
                    SizedBox(height: 20),
                 Cutomtext(text: 'SIGN UP',stylee: AppTextStyles.headline,),
                    SizedBox(height: 10),
                    customform(
                      hint: "Name",
                      mycontroller: namecontroller,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Name must not be empty';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.person,
                    ),
                    SizedBox(height: 15),
                    customform(
                      hint: "Email",
                      mycontroller: emailcontroller,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Email must not be empty';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email,
                    ),
                    SizedBox(height: 15),
                    customform(
                      hint: "PassWord",
                      mycontroller: PassWordcontroller,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'PassWord must not be empty';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icons.lock,
                      ispassword: ispassword,
                      suffixIcon:
                          ispassword ? Icons.visibility_off : Icons.visibility,
                      suffixPressed: () {
                        setState(() {
                          ispassword = !ispassword;
                        });
                      },
                    ),
                    SizedBox(height: 15),
                    Custombuttom(
                      BColor: AppColors.primaryColor,
                      text: 'sign up',
                      onPressed: () {
                        if (sk.currentState!.validate()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        }
                      },
                      Tcolor: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Customdriver(text: 'OR Log In With '),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
