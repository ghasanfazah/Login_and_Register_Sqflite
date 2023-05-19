import 'package:flutter/material.dart';
import 'package:my_project/Data/db.dart';

class HomeAc extends StatefulWidget {
  const HomeAc({Key? key}) : super(key: key);

  @override
  State<HomeAc> createState() => _HomeAcState();
}


class _HomeAcState extends State<HomeAc> {

  db sqldb = db();

  GlobalKey<FormState> formstate = GlobalKey();

  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController family = TextEditingController();
  TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Form(
              key: formstate,
              child: Column(
                children: [
                  TextFormField(
                    controller: user,
                    decoration: const InputDecoration(
                      hintText: 'User name',
                    ),
                  ),
                  TextFormField(
                    controller: password,
                    decoration: const InputDecoration(
                      hintText: "password",
                    ),
                  ),
                  TextFormField(
                    controller: family,
                    decoration: const InputDecoration(
                      hintText: 'family',
                    ),
                  ),
                  TextFormField(
                    controller: age,
                    decoration: const InputDecoration(
                      hintText: 'age',
                    ),
                  ),
                  Container(height: 20),
                  MaterialButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () async {
                          int Response = await sqldb.insertData('''
                      INSERT INTO User (`name` , `password` , `family` , `age` )
                      VALUES  ("ggg" ,"123" ,"gh","22")
                      ''');
                          print("Response*************************");
                          print("${Response}");
                    },
                    child: Text("Add User"),
                  ),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  MaterialButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () async {

                      int Response = await sqldb.insertData(''' 
                      INSERT INTO 'user' ('name' ,'age' ,'family' , 'password')
                        // VALUES  ("${user.text}" ,"${password.text}" ,"${family.text}","${age.text}")
                      ''');
                           print("Response*************************");
                           print("${Response}");

                      //     int Response = await sqldb.insertData('''
                      // INSERT INTO User (`name` , `password` , `family` , `age` )
                      // VALUES  ("${user.text}" ,"${password.text}" ,"${family.text}","${age.text}")
                      // ''');
                      //     print("Response*************************");
                      //     print("${Response}");
                    },
                    child: const Text("Insert User"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
