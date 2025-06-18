import 'package:flutter/material.dart';

import '../../../../../core/functions/custom_validator.dart';
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (sk.currentState!.validate()) {}
                },
                child: Text("Sign Up"),
              ),
            ),
            SizedBox(height: 15),
            HaveAnAccountSection(),
          ],
        ),
      ),
    );
  }
}
