import 'dart:io';

Future<void> main() async {
  final server = await HttpServer.bind(InternetAddress.anyIPv4, 8000);
  print('Server running on http://localhost:${server.port}');

  await for (HttpRequest request in server) {
    request.response
      ..statusCode = HttpStatus.ok
      ..headers.contentType = ContentType.text
      ..write('Hello, From DevOps Hobbies (via HTTP)')
      ..close();
  }
}
