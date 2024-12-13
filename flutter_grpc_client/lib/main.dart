import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
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
        primarySwatch: Colors.blue,
      ),
      home: FibonacciScreen(),
    );
  }
}

class FibonacciScreen extends StatefulWidget {
  @override
  _FibonacciScreenState createState() => _FibonacciScreenState();
}

class _FibonacciScreenState extends State<FibonacciScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';
  bool _isLoading = false;

  Future<void> _getFibonacci() async {
    final channel = ClientChannel(
      'localhost', // Replace with the Go server's address
      port: 50052,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    final stub = FibonacciServiceClient(channel);

    final request = FibonacciRequest()..number = int.parse(_controller.text);

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await stub.getFibonacci(request);
      setState(() {
        _result = 'Fibonacci: ${response.fibNumber}';
      });
    } catch (e) {
      setState(() {
        _result = 'Error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
      await channel.shutdown();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fibonacci Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter a number',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _getFibonacci,
              child: _isLoading
                  ? CircularProgressIndicator()
                  : Text('Get Fibonacci'),
            ),
            SizedBox(height: 20),
            Text(_result, style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}

