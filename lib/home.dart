import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late AnimationController  _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
        _controller.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
           Navigator.pop(context);
           _controller.reset();
          }
        });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        // backgroundColor: Colors.grey.shade800,
        title: const Text('Lottie'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Lottie.asset(
              "assets/love_animation.json",
              animate: true,
              repeat: true,
            ),
            const SizedBox(
              height: 200,
            ),
            ElevatedButton(
              onPressed: () {
                _showAlertDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(1, 100, 133, 61), // Set button color
              ),
              child: const Text(
                'Hello Animation',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title: const Text('Lottie'),
          content: Lottie.asset('assets/celebrate.json',controller: _controller,onLoaded: (compositon){
            _controller.forward();
          }),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}


