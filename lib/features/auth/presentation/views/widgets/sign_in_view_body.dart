import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/functions/custom_validator.dart';

import '../../../../../core/widgets/custom_checkBox.dart';
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
                GestureDetector(onTap: () {}, child: Text("Forget Password?")),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (lk.currentState!.validate()) {}
                },
                child: Text("Sign In"),
              ),
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
