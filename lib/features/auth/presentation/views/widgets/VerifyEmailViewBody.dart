import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/custom_validator.dart';
import '../../../../../core/widgets/CustomLoadingCircle.dart';
import '../../../../../core/widgets/show_err_dialog.dart';
import '../../cubits/verifycode/verifycode_cubit.dart';
import '../sign_in_view.dart';

class VerifyEmailViewBody extends StatefulWidget {
  const VerifyEmailViewBody({super.key});

  @override
  State<VerifyEmailViewBody> createState() => _VerifyEmailViewBodyState();
}

class _VerifyEmailViewBodyState extends State<VerifyEmailViewBody> {
  final GlobalKey<FormState> reskey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Form(
          key: reskey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Please enter the verification code sent to your email address',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                ),
                validator: CustomValidator.emailValidator,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: codeController,
                decoration: InputDecoration(
                  labelText: 'Verification code',
                  prefixIcon: const Icon(Icons.code),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the verification code';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              BlocConsumer<VerifycodeCubit, VerifycodeState>(
                listener: (context, state) {
                  if (state is VerifycodeSuccess) {
                    Navigator.pushReplacementNamed(
                      context,
                      SignInView.routeName,
                    );
                  } else if (state is VerifycodeError) {
                    showerrorDialog(
                      context: context,
                      title: "!Oops",
                      description: state.errMessage,
                    );
                  }
                },
                builder: (context, state) {
                  return state is VerifycodeLoading
                      ? Center(child: CustomLoadingCircle())
                      : SizedBox(
                        width: double.infinity,

                        child: ElevatedButton(
                          onPressed: () {
                            if (reskey.currentState!.validate()) {
                              context.read<VerifycodeCubit>().verifyCode(
                                email: emailController.text,
                                code: codeController.text,
                              );
                            }
                          },
                          child: const Text("Submit"),
                        ),
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
