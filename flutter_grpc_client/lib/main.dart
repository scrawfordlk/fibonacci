import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'dart:math'; // For custom animation
import 'dart:async'; // For Stopwatch
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'generated/fibonacci.pb.dart';
import 'generated/fibonacci.pbgrpc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fibonacci Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey, // Soft blue-grey theme
      ),
      home: FibonacciScreen(),
    );
  }
}

class FibonacciScreen extends StatefulWidget {
  @override
  _FibonacciScreenState createState() => _FibonacciScreenState();
}

class _FibonacciScreenState extends State<FibonacciScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  String _result = '';
  String _timeTaken = '';
  bool _isLoading = false;

  // Controller for custom loading animation
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 2), // Smooth 2-second rotation
      vsync: this,
    )..repeat(); // Automatically start repeating
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _getFibonacci() async {
    final channel = ClientChannel(
      'localhost', // Replace with the Go server's address
      port: 50052,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    final stub = FibonacciServiceClient(channel);

    final request = FibonacciRequest()..number = int.parse(_controller.text);

    // Start the stopwatch to measure time taken
    final stopwatch = Stopwatch()..start();

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await stub.getFibonacci(request);
      stopwatch.stop();

      setState(() {
        _result = 'Fibonacci: ${response.fibNumber}';
        _timeTaken = 'Time taken: ${stopwatch.elapsedMilliseconds} ms';
      });
    } catch (e) {
      setState(() {
        _result = 'Error: $e';
        _timeTaken = ''; // Clear time on error
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
      await channel.shutdown();
    }
  }

  Widget _buildCustomLoading() {
    return Center(
      child: LoadingAnimationWidget.halfTriangleDot(
        color: Colors.white,
        size: 200,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fibonacci Calculator'),
        backgroundColor: Color(0xFFB0BEC5), // Soft pastel grey-blue
      ),
      backgroundColor: Color(0xFFECEFF1), // Light soft grey background
      body: Center(
        child: SizedBox(
          width: 350, // Fixed width for the box
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!_isLoading) ...[
                  // Input field
                  TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter a number',
                      labelStyle: TextStyle(color: Color(0xFF607D8B)), // Soft grey-blue
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFF90A4AE), width: 2.0), // Muted grey-blue
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFF81C784), width: 2.0), // Pastel green
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Calculate button
                  ElevatedButton(
                    onPressed: _getFibonacci,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(0xFF81C784), // Soft pastel green button
                    ),
                    child: Text('Get Fibonacci'),
                  ),
                  SizedBox(height: 20),
                ],
                if (_isLoading) ...[
                  // Custom loading animation
                  _buildCustomLoading(),
                  SizedBox(height: 20),
                  Text(
                    'Calculating...',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF455A64), // Soft dark grey-blue
                    ),
                  ),
                ],
                if (!_isLoading && _result.isNotEmpty) ...[
                  // Show the result
                  Text(
                    _result,
                    style: TextStyle(
                        fontSize: 24, color: Color(0xFF455A64)), // Soft dark grey-blue
                  ),
                  SizedBox(height: 10),
                  if (_timeTaken.isNotEmpty)
                    Text(
                      _timeTaken,
                      style: TextStyle(
                          fontSize: 18, color: Color(0xFF78909C)), // Muted grey-blue
                    ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

