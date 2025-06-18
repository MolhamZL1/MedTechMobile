import 'package:flutter/material.dart';

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
      appBar: AppBar(title: Text('Reset Password')),
      body: SingleChildScrollView(
        child: Form(
          key: reskey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 150),
            child: Column(
              children: [
                // customform(
                //   hint: 'Enter New Password',
                //   mycontroller: newpass,
                //   validate: (value) {
                //     if (value!.isEmpty) {
                //       return '8 symbols at least';
                //     } else {
                //       return null;
                //     }
                //   },
                // ),
                // SizedBox(height: 15),
                // customform(
                //   hint: 'Confirm Password',
                //   mycontroller: newpass,
                //   validate: (value) {
                //     if (value!.isEmpty) {
                //       return '8 symbols at least';
                //     } else {
                //       return null;
                //     }
                //   },
                // ),
                SizedBox(height: 50),
                ElevatedButton(onPressed: () {}, child: Text("Submit")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
