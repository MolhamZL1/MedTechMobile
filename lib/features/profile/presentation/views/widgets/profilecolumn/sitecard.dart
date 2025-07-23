import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/sitepage/sitepage.dart';

class Sitecard extends StatelessWidget {
  const Sitecard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap: () {
  Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => Sitepage(), 
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
                  color: Colors.green.withOpacity(
                    0.1,
                  ), 
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.location_on_outlined, 
                    color: Colors.green,
                    size: 24,
                  ),
                ),
              ),
      
              SizedBox(width: 10),
              Text("العنواين والمواقع "),
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
