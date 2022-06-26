import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _bottomSheet () {
    showModalBottomSheet(context: context,
        builder: (context) =>Container(
          height: 200,
          width: 200,
          child: Text('Bottom Sheet'),
        ));
  }


  _showOwnDialog() {
    showDialog(
        context: context,
        builder: (context) => Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(

            height: double.infinity,
            width: double.infinity,

            child: Stack(
              children: [
                Positioned(
                  top: 200,
                  left: 100,
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.yellow,
                  ),
                ),
                Positioned(
                  top: 250,
                  left: 150,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),

                  ),
                ),
              ],
            ),
          ),
        )
    );
  }


  _showSimpleDialog(){
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('Simple Dialog'),
        children: [
          SimpleDialogOption(
            onPressed: () {
              print('Options 1 Clicked');
            },
            child: Text('Option 1'),
          ),
          SimpleDialogOption(
            onPressed: () {
              print('Options 2 Clicked');
            },
            child: Text('Option 2'),
          ),
          SimpleDialogOption(
            onPressed: () {
              print('Options 3 Clicked');
            },
            child: Text('Option 3'),
          ),
        ],
      )
    );
  }


  _showMyDialog() {
    showDialog(context: context,
        barrierDismissible: false,
        builder: (contex) => AlertDialog(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          title: Text('Title of alert'),
          content: Text('Description of dialog'),
          actions: [
            TextButton(
                onPressed: () {
                  print('cancel');
                  Navigator.of(context).pop();
                } , child: Text('Cancel')),
            TextButton(
                onPressed: () {
                  print('Confirm');
                  Navigator.of(context).pop();
                } , child: Text('Confirm')),
          ],
        )
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter Dialog Demo'),
      ),
      body: Center(
        child: ElevatedButton(

          onPressed: _bottomSheet,
          child: Text('Bottomsheet'),
        ) ),
    );
  }
}

