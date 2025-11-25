
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Consts/colors.dart';
import 'profile_form.dart';


class RegScreen extends StatefulWidget {
  const RegScreen({super.key});

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Primary,

      body:
      Column(  
        mainAxisAlignment: MainAxisAlignment.end,      
        children: [
          Container(
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
           borderRadius: 
           BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0)
           ),
           boxShadow: [
            BoxShadow(
              color: AppColors.Secondary,
              spreadRadius: 3,
              blurRadius: 7,  
              offset: Offset(0, 3),
            )
           ]
          ),
                
          child: 
           Padding(
             padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10),
             child: Column 
                (
                
                children: 
                [
                  Text("My Profile",style: TextStyle(
                    fontSize: 20,
                    color: AppColors.Secondary,
                    fontWeight: FontWeight.bold
                  ),),
                  Spacer(),      
                  RegForm(),
                          
                ],
                  ),
           ),
           ),
                    
      // Positioned(
      //     top: 0,
      //     left: 0,
      //     child: 
      //     CircularProfileAvatar(
      //                      "",
      //     radius: 100,         
      //     backgroundColor: Colors.transparent, 
      //     borderWidth: 2,                  
      //     borderColor: Colors.brown, 
      //     elevation: 5.0, 
      //     child: Image.asset(
      //     'lib/Images/profile_img.webp',
      //     fit: BoxFit.cover,  
      //                      )
                    
      //     ),
                          
      //         ),
        ],
      ),


    );
  }
}



