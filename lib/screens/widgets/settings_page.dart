import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 69, 8, 57),
              title: const Text('Settings',style: TextStyle(color: Colors.white),),
              centerTitle: true,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('Currency'),
            trailing: Icon(Icons.arrow_forward_ios),
            

          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            trailing: Icon(Icons.arrow_forward_ios),
            ),

          ListTile(
            leading: Icon(Icons.restore),
            title: Text('Reset'),
           ),

           ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
           ),
           ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Feedback'),
           ),
           ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
           ),

        ],
      ),
    );

  }
}