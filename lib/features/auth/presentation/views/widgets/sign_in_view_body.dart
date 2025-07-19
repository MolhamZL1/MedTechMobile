import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/functions/custom_validator.dart';
import 'package:medtech_mobile/features/auth/presentation/cubits/signin/sign_in_cubit.dart';
import 'package:medtech_mobile/features/auth/presentation/views/forget_password_view.dart';
import 'package:medtech_mobile/features/main/presentaion/views/main_view.dart';

import '../../../../../core/widgets/CustomLoadingCircle.dart';
import '../../../../../core/widgets/custom_checkBox.dart';
import '../../../../../core/widgets/show_err_dialog.dart';
import 'CustomPasswordTextField.dart';
import 'DontHaveAnAccountSection.dart';
import 'customdriver.dart';
import 'customlogoimage.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  GlobalKey<FormState> lk = GlobalKey();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passWordcontroller = TextEditingController();
  bool isRememberMeValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Form(
        key: lk,
        child: ListView(
          children: [
            Customlogoimage(),
            SizedBox(height: 20),
            Text("Sign In", style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 10),
            TextFormField(
              validator: CustomValidator.emailValidator,
              keyboardType: TextInputType.emailAddress,
              controller: emailcontroller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: "Email",
              ),
            ),
            SizedBox(height: 15),
            CustomPasswordTextField(textEditingController: passWordcontroller),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomCheckBox(
                  value: isRememberMeValue,
                  onChanged: (p0) {
                    isRememberMeValue = p0!;
                    setState(() {});
                  },
                  title: "Remember Me",
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ForgetPasswordView.routeName);
                  },
                  child: Text("Forget Password?"),
                ),
              ],
            ),
            SizedBox(height: 10),
            BlocConsumer<SignInCubit, SignInState>(
              listener: (context, state) {
                if (state is SignInSuccess) {
                  Navigator.pushReplacementNamed(context, MainView.routeName);
                } else if (state is SignInError) {
                  showerrorDialog(
                    context: context,
                    title: "!Oops",
                    description: state.errMessage,
                  );
                }
              },
              builder: (context, state) {
                return state is SignInLoading
                    ? Center(child: CustomLoadingCircle())
                    : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (lk.currentState!.validate()) {
                            log(emailcontroller.text + passWordcontroller.text);
                            context.read<SignInCubit>().signIn(
                              email: emailcontroller.text,
                              password: passWordcontroller.text,
                            );
                          }
                        },
                        child: Text("Sign In"),
                      ),
                    );
              },
            ),
            SizedBox(height: 15),
            DontHaveAnAccountSection(),
            CustomOrDivider(text: 'OR'),
          ],
        ),
      ),
    );
  }
}
