import 'package:flutter/material.dart';


class customform extends StatelessWidget {
  @required String hint ;
   @required  TextInputType? keyboardType;
  @required  IconData? prefixIcon;
   final IconData? suffixIcon;
   @required TextEditingController mycontroller;
   @required String? Function(String?)? validate;
    void Function()? suffixPressed;
   bool ispassword ;
   
   customform({super.key, required this.hint, required this.mycontroller,
    this.prefixIcon,this.suffixIcon, this.keyboardType,required this.validate,
    this.ispassword = false, this.suffixPressed
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        
        obscureText: ispassword,
        validator: validate,
        keyboardType: keyboardType,
                    controller: mycontroller,
                     decoration: InputDecoration( 
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      prefixIcon: Icon(prefixIcon,),
                      suffixIcon: suffixIcon != null?IconButton(onPressed: suffixPressed,
                       icon:Icon(suffixIcon)  ) : null,
                      labelText: hint,
                      hintStyle: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium?.color
                      ),
                       focusColor: Colors.blue,
                       
                       border: OutlineInputBorder(
                        
                         borderRadius: BorderRadius.circular(20),
                         
                            
                       )              
                     ),
                   ),
    );
  }
}