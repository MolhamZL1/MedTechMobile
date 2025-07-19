import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/widgets/show_err_dialog.dart';
import 'package:medtech_mobile/features/auth/presentation/cubits/signup/sign_up_cubit.dart';
import 'package:medtech_mobile/features/auth/presentation/views/verify_email_view.dart';

import '../../../../../core/functions/custom_validator.dart';
import '../../../../../core/widgets/CustomLoadingCircle.dart';
import 'CustomPasswordTextField.dart';
import 'HaveAnAccountSection.dart';
import 'customlogoimage.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> sk = GlobalKey();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passWordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Form(
        key: sk,
        child: ListView(
          children: [
            Customlogoimage(),
            SizedBox(height: 20),
            Text("Sign Up", style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 10),
            TextFormField(
              validator: CustomValidator.nameValidator,
              keyboardType: TextInputType.name,
              controller: namecontroller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "Name",
              ),
            ),
            SizedBox(height: 15),
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

            SizedBox(height: 10),
            BlocConsumer<SignUpCubit, SignUpState>(
              listener: (context, state) {
                if (state is SignUpSuccess) {
                  Navigator.pushNamed(context, VerifyEmailView.routeName);
                } else if (state is SignUpError) {
                  log(state.errMessage);
                  showerrorDialog(
                    context: context,
                    title: "!Oops",
                    description: state.errMessage,
                  );
                }
              },
              builder: (context, state) {
                return state is SignUpLoading
                    ? Center(child: CustomLoadingCircle())
                    : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (sk.currentState!.validate()) {
                            context.read<SignUpCubit>().signUp(
                              name: namecontroller.text,
                              email: emailcontroller.text,
                              password: passWordcontroller.text,
                            );
                          }
                        },
                        child: Text("Sign Up"),
                      ),
                    );
              },
            ),
            SizedBox(height: 15),
            HaveAnAccountSection(),
          ],
        ),
      ),
    );
  }
}
