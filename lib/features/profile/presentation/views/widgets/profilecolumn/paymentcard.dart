import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/payment/paymentpage.dart';

class Paymentcard extends StatelessWidget {
  const Paymentcard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
         onTap: () {
  Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => Paymentpage(), 
  ),
);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(
                    0.1,
                  ), 
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.payment, 
                    color: Colors.orange, 
                    size: 24,
                  ),
                ),
              ),
      
              SizedBox(width: 10),
              Text("طرق الدفع "),
                 const Spacer(),
              IconButton(onPressed: () {  },
              icon: Icon(Icons.arrow_drop_down),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
