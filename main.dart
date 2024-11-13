import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Entry Point of the App
void main(){
  runApp(greetingCardApp());
  return;
}

// Main app widget
class greetingCardApp extends StatefulWidget {
  const greetingCardApp({super.key});

  @override
  State<greetingCardApp> createState() => _greetingCardAppState();
}

class _greetingCardAppState extends State<greetingCardApp> {
  //Controller to take the input from the TextField.
  TextEditingController _nameController=TextEditingController();
  String? username;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Hides the Debugg banner from above the screen
        debugShowCheckedModeBanner: false,
         home: Scaffold(
            appBar: AppBar(
              title: Text("Greeting Card App"),
              // Center the title in the app bar
              centerTitle: true,
              //set Background color of the appbar
              backgroundColor: Colors.blue,
            ),

             body: SingleChildScrollView( //widger for enable Scrollbar
               child: Column(
                children: [

                  //Give Space Above the TextField
                  SizedBox(height: 100),

                  // TextField for taking username as a input in runtime.
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        hintText: "Enter Your Name",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:  Colors.blue,
                                width: 5),
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),

                  //Give Space above Text Widget.
                  SizedBox(height: 60),

                  // Text widget to display greeting message
                  Text("Hello, $username" ?? "Hello Greeting",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),

                  SizedBox(height:60),

                 // here we use ElevatedButton to trigger actions when the button is pressed,
                  // also use setState for updating the state and showing a toast message if the textField is empty.
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        //set username from input
                        username = _nameController.text.toString();

                        // show message if the textfield is empty
                        if(username!.isEmpty){
                          Fluttertoast.showToast(
                           msg: "Text Field is Empty!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.blue,
                          );
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue),
                    child: Text("Show Greeting", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black)),
                  ),
                ],
              ),
            )
        )
    );
  }
} 