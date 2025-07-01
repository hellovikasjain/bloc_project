import 'package:flutter/material.dart';



class MultiPageForm extends StatefulWidget {
  const MultiPageForm({super.key});

  @override
  MultiPageFormState createState() => MultiPageFormState();
}

class MultiPageFormState extends State<MultiPageForm> {
  final PageController _pageController = PageController();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  String name = '';
  String email = '';

  void _nextPage() {
    if (_formKey1.currentState!.validate()) {
      _formKey1.currentState!.save();
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _submitForm() {
    if (_formKey2.currentState!.validate()) {
      _formKey2.currentState!.save();
      // Form is valid. Do submission here.
      print("Name: $name");
      print("Email: $email");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form Submitted')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multi Page Form')),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(), // Prevent swiping manually
        children: [
          // Page 1
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Page 1: Name', style: TextStyle(fontSize: 20)),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) =>
                    value == null || value.isEmpty ? 'Enter your name' : null,
                    onSaved: (value) => name = value!,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _nextPage,
                    child: Text('Next'),
                  ),
                ],
              ),
            ),
          ),

          // Page 2
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Page 2: Email', style: TextStyle(fontSize: 20)),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) =>
                    value == null || !value.contains('@') ? 'Enter valid email' : null,
                    onSaved: (value) => email = value!,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
