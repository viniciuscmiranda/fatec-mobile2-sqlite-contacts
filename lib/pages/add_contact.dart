import 'package:flutter/material.dart';
import 'package:sqlite/widgets/custom_textfield.dart';

class AddContactPage extends StatefulWidget {
  AddContactPage({Key key}) : super(key: key);

  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Contacts'),
      ),
      body: Column(
        children: [
          CustomTextField(
            controller: nameController,
            label: 'Nome completo',
            icon: Icons.person,
          ),
          CustomTextField(
            controller: phoneController,
            label: 'Telefone',
            icon: Icons.phone,
          ),
          CustomTextField(
            controller: emailController,
            label: 'E-mail',
            icon: Icons.email,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.person_add),
      ),
    );
  }
}
