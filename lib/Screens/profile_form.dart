import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Consts/colors.dart';
import '../Widgets/TextFormFieldWidget.dart';

class RegForm extends StatefulWidget {
  const RegForm({super.key});

  @override
  State<RegForm> createState() => _RegFormState();
}

class _RegFormState extends State<RegForm> {
 final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _phoneController=TextEditingController();
  final TextEditingController _ageController=TextEditingController();
  final TextEditingController _bioController=TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _ageController.dispose();
    _bioController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 10,
          children: [
            Spacer(flex: 1,),
            TextFormField_Widget(textfielicon: Icons.person, 
            txt: 'Full name',
            controler: _nameController, 
            validator: (value) {
              if(value!.isEmpty){
                return "Please enter your full name";
              }
              return null;
              }, hinttxt: 'Write your full name',),
        
            TextFormField_Widget(textfielicon: Icons.email,
             txt: 'E-mail', 
             controler: _emailController, 
             validator: (value) {
              if (value!.isEmpty){
                return "Please enter your E-mail";
              }
               if (!value.contains("@")){
                return "E-mail must contains @";
              }
              return null;
               }, hinttxt: 'Write your E-mail',),
        
             TextFormField_Widget(textfielicon: Icons.phone, 
             txt: 'Phone', 
             controler: _phoneController, 
             validator: (value) {
              if (value!.isEmpty){
                return "Please enter your phone number";
              }
              if (value.contains(RegExp(r'\D'))){
                return "Please enter a valid phone number";
              }
        
              if (value.length!=10 && value.length!=11){
                return "Phone number must contain 10-11 number ";
              }
              return null;
               }, hinttxt: 'Write your phone number',),
        
            TextFormField_Widget(textfielicon: Icons.cake,
             txt: 'Age', 
             controler: _ageController, 
             validator: (value) {
              if (value!.isEmpty){
                return "Please enter your age";
              }
              if (value.contains(RegExp(r'\D'))){
                return "Please enter a valid age";
              }
              if (int.parse(value) < 18 || int.parse(value)>100){
                return "Age must be between 18 and 100";
              }
              return null;
               }, hinttxt: 'Write your age',),

      
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
                  children: [
                    Text("Bio",
                    style: TextStyle(fontSize: 12),
                    ),
                    
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: TextFormField(
                        maxLength: 200,
                        maxLines: 6,
                        controller: _bioController,
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                        errorStyle: TextStyle(
                        fontSize: 7, 
                        color: Colors.red, 
                        fontWeight: FontWeight.bold, 
                      ),
                      hintText:"Write Bio about yourself",
                        suffixIcon: 
                            Icon(
                              Icons.info,
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
                      validator:(value) {
                      if (value!.length > 200){
                      return "Maximum 200 characters allowed";
                      }
                      return null;
                      }
                    ),
        
                  ),
                  ],
                ),

            Spacer(flex: 2,),
            Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(shape: BoxShape.rectangle),
              child: ElevatedButton(
                onPressed: () {
                if (formkey.currentState!.validate()) {
                  String values = 
                  "Full Name: ${_nameController.text}\n"
                  "Email: ${_emailController.text}\n"
                  "Phone: ${_phoneController.text}\n"
                  "Age: ${_ageController.text}\n"
                  "Bio: ${_bioController.text.isEmpty ? "null" : _bioController.text}";
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Submitting successful\n$values"),
                       backgroundColor: Colors.green,
                       duration: Duration(seconds: 5),
                    ),
                  );
                }
              },
              style:ElevatedButton.styleFrom(
                backgroundColor: AppColors.Primary,
                elevation: 5,
                shadowColor: AppColors.Secondary
              ),
              child: Text("Submit",style: TextStyle(color: Colors.white),),
              
                      ),
            ),

            Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(shape: BoxShape.rectangle),
              child: ElevatedButton(
                onPressed: () {
                  _nameController.clear();
                  _emailController.clear();
                  _phoneController.clear();
                  _ageController.clear();
                  _bioController.clear();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 5,
                  shadowColor: AppColors.Secondary,
                  side: BorderSide(color: AppColors.Primary, width: 1.5),
                ),
                child: Text(
                  "Clear",
                  style: TextStyle(color: AppColors.Primary),
                ),
              ),
            ),
          Spacer(flex: 1,)
       
          ],
        ),
      )
              );
  }
}

