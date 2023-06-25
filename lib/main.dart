import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HTTP Methods 21BEE1266',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/bg4.jpg',
                fit: BoxFit.cover,
              ),
            ),
            MyHomePage(title: 'HTTP Methods 21BEE1266'),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  late String _responseText;

  @override
  void initState() {
    super.initState();
    _responseText = '';
  }

  void _performGetRequest() async {
    final String url = _urlController.text;
    final response = await http.get(Uri.parse(url));

    setState(() {
      _responseText = response.body;
    });
  }

  void _performPostRequest() async {
    final String url = _urlController.text;
    final String body = _bodyController.text;
    final response = await http.post(Uri.parse(url), body: body);

    setState(() {
      _responseText = response.body;
    });
  }

  void _performPutRequest() async {
    final String url = _urlController.text;
    final String body = _bodyController.text;
    final response = await http.put(Uri.parse(url), body: body);

    setState(() {
      _responseText = response.body;
    });
  }

  void _performDeleteRequest() async {
    final String url = _urlController.text;
    final response = await http.delete(Uri.parse(url));

    setState(() {
      _responseText = response.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter URL:',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(250, 140, 31, 40),
                ),
              ),
              TextField(
                controller: _urlController,
                decoration: InputDecoration(
                  hintText: 'https://example.com/api/endpoint',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor:
                      const Color.fromARGB(255, 71, 67, 67).withOpacity(0.3),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Enter Request Body (for POST and PUT):',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(250, 140, 31, 40),
                ),
              ),
              TextField(
                controller: _bodyController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Your Message :)',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor:
                      const Color.fromARGB(255, 71, 67, 67).withOpacity(0.3),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _performGetRequest,
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(150, 100, 204, 197)),
                child: Text('GET :D'),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: _performPostRequest,
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(150, 100, 204, 197)),
                child: Text('POST  ^.^'),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: _performPutRequest,
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(150, 100, 204, 197)),
                child: Text('PUT  8)'),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: _performDeleteRequest,
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(150, 100, 204, 197)),
                child: Text('DELETE  ;('),
              ),
              SizedBox(height: 20.0),
              Text(
                'Response:',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(250, 140, 31, 40),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                _responseText,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
