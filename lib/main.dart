import 'package:flutter/material.dart';
import 'package:my_project/Screen/HomeAc.dart';
import 'Data/db.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        '/Home': (context) => const HomeAc(),
      },
    );
  }
}

class Home extends StatefulWidget {

  get name => yourControllerName;

  get Password => yourControllerPassword;

  TextEditingController yourControllerName = TextEditingController();
  TextEditingController yourControllerPassword = TextEditingController();

  db sqldb = db();

  Home({super.key});

  Future<List<Map>> readData(String user, String pass) async {
    List<Map> response = await sqldb.readData(
        "SELECT * FROM user WHERE user = $name and password =$Password");
    return response;
  }

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>(); //key for form

  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),

        backgroundColor: const Color(0xFFffffff),
        body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: _formKey, //key for form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),
                const Text(
                  "Here to Get",
                  style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                ),
                const Text(
                  "Welcomed !",
                  style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter the Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter the correct name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: "Enter the password"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter the correct Password";
                    } else {


                      return null;
                    }
                  },
                ),

                const SizedBox(
                  height: 55,
                  width: 55,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),

                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(

                          const SnackBar(content: Text('Processing Data')),

                        );
                        Navigator.pushNamed(context, '/Home');
                      }
                    },
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
