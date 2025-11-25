import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Consts/colors.dart';

class TextFormField_Widget extends StatefulWidget {
 final IconData?  textfielicon;
 final bool isPassword;
 final String txt;
 final TextEditingController controler;
 final String? Function(String?) validator;
 final String hinttxt;

  const TextFormField_Widget({
    super.key,
    this.textfielicon,
    this.isPassword = false, 
    required this.txt, 
    required this.controler, 
    required this.validator, 
    required this.hinttxt, 
  });

  @override
  State<TextFormField_Widget> createState() => _TextFormField_WidgetState();
}

class _TextFormField_WidgetState extends State<TextFormField_Widget> {
  bool obscureTextState=false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 3,
      children: [
        Text(widget.txt,
        style: TextStyle(fontSize: 12),
        ),

        SizedBox(
          height: 47,
          width: double.infinity,
          child: TextFormField(
            controller:widget.controler,
            obscureText:widget.isPassword ? obscureTextState : false,
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
            errorStyle: TextStyle(
            fontSize: 7, 
            color: Colors.red, 
            fontWeight: FontWeight.bold, 
          ),
          hintText: widget.hinttxt,
            suffixIcon: 
            widget.isPassword 
            ? IconButton(
              iconSize: 40,
              color: AppColors.Primary,
              onPressed: (){setState(() {
                obscureTextState = !obscureTextState;
              });},
                icon: obscureTextState ? Icon(Icons.visibility_off): Icon(Icons.visibility))  
                : Icon(
                   widget.textfielicon,
                  color: AppColors.Primary,
                  size: 20,
                ),         
                
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: AppColors.Secondary,
                  width: 1,
                ),               
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: AppColors.Primary,
                  width: 2,
                ),  
            ),

            errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),                           
              ),
              validator: widget.validator,
            ),

           
          
            
          
          ),
    
    
        
      ],
    );
  }
}