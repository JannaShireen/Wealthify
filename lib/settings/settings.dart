
import 'package:wealthify/screens/home/screen_transaction_home.dart';

import 'package:wealthify/settings/widgets/about_page.dart';
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 204, 204),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 6, 6),
              title: const Text('Menu',style: TextStyle(color: Colors.white),),
              centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: 
            
            
            
            
             [
              
        
              ListTile(
                leading: Icon(Icons.restore),
                title: Text('Reset'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.of(ctx).pop(),
                              child: const Text(
                                'No',
                                style: TextStyle(color: Colors.blueGrey),
                              )),
                          const SizedBox(
                            width: 30,
                          ),
                          TextButton(
                            onPressed: () async {
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              await pref.clear();
                              await Hive.deleteFromDisk();
                              // TransactionDB.instance.resetApp();
                              // resetApp();
                              //final categoryDB =
                              //     await Hive.openBox<CategoryModel>(
                              //         'category-database');

                              // categoryDB.clear();

                              // final transactionDb =
                              //     await Hive.openBox<TransactionModel>(
                              //         'Transaction-database');

                              // transactionDb.clear();
                             
                              // Hive.box('category-database').clear();
                              // Hive.box('Transaction-database').clear();

                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        ],
                        title: const Text("Reset App"),
                        content: const Text(
                            "Are you sure you want to reset the app?"),
                      );
                    },
                  );
                },
               ),
       const  Divider(
          thickness: 2,
        ),
                ListTile(
                leading: Icon(Icons.share),
                title: Text('Share'),
                onTap: () {
                  Share.share(
                      'hey! check out this new app......');
                },
               
                
               ),

                const Divider(
          thickness: 2,
        ),
                ListTile(
                leading: Icon(Icons.feedback),
                title: Text('Feedback'),
                 onTap: () async {
                  const url =
                      'mailto:jannashireen@gmail.com?subject=Review on Money Management &body= Can you help me';
                  Uri uri = Uri.parse(url);

                  await launchUrl(uri);
                },
               ),
                const Divider(
          thickness: 2,
        ),
               ListTile(
                leading: Icon(Icons.info),
                title: Text('About'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) {
                        return  AboutPage();
                      }),
               ));
               },
               ),

               const Divider(
          thickness: 2,
        ),
        
            ],
          ),
        ),
      ),
    );

  }
}