import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';
import 'package:medtech_mobile/core/utils/app_images.dart';
import 'package:medtech_mobile/core/utils/app_text_styles.dart';
import 'package:medtech_mobile/features/auth/presentation/views/sign_up_view.dart';
import 'package:medtech_mobile/features/auth/presentation/views/widgets/home.dart';
import 'package:medtech_mobile/features/auth/presentation/views/widgets/items/custombuttom.dart';
import 'package:medtech_mobile/features/auth/presentation/views/widgets/items/customform.dart';
import 'package:medtech_mobile/features/auth/presentation/views/widgets/items/customlogoimage.dart';
import 'package:medtech_mobile/features/auth/presentation/views/widgets/items/customtext.dart';
import 'package:medtech_mobile/features/auth/presentation/views/widgets/items/fingerprintdesign.dart';
import 'package:medtech_mobile/features/auth/presentation/views/widgets/resetpassword.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  GlobalKey<FormState> lk = GlobalKey();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController PassWordcontroller = TextEditingController();
  bool ispassword = true;
   bool isChecked =false;

  //   void checkFingerprintEnabled() async {
  //   final storage = FlutterSecureStorage(
  //       aOptions: AndroidOptions(encryptedSharedPreferences: true));
  //   String? fprint = await storage.read(key: "fingerprint");

  //   if (fprint != null && fprint.isNotEmpty) {
  //     setState(() {
  //       isFingerprintEnabled = true;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical:30),
        child: ListView(
          children: [
            Form(
              key: lk,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                  Customlogoimage(),
                    SizedBox(height: 20),
                    Cutomtext(text: 'LOG IN', stylee: AppTextStyles.headline,),
                    SizedBox(height: 10),
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
                          ispassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                      suffixPressed: () {
                        setState(() {
                          ispassword = !ispassword;
                        });
                      },
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        children: [
                       
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                   isChecked = !isChecked;
                              });
                            },
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey),
                                color:
                                     isChecked ? AppColors.primaryColor : Colors.transparent,
                              ),
                              child: isChecked?
                                  Icon(
                                Icons.check,
                                size: 14,
                                color: Colors.white,
                              )
                             : null,
                            ),
                          ),

                          SizedBox(width: 15),

                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Remember me"),
                                GestureDetector(
                                  onTap: () {
                                         Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Resetpassword()));
                                  },
                                  child: Text("Forget Password?")),
                              ],
                            ),
                          ),
                        ],
                      ),),
                    Custombuttom(
                      BColor: AppColors.primaryColor,
                      text: 'log in',
                      onPressed: () {
                         if (lk.currentState!.validate() )
                         {
                         Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home()));
                         }
                        
                      },
                      Tcolor: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        children: [
                          Text("Don’t have an account?"),
                          SizedBox(width: 2),
                          GestureDetector(
                            onTap: () {},
                            child: GestureDetector(
                              onTap: () {
                              Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => SignUpView()));
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildfingerprintBlocBuilder(),
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
