// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Mail Client',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: LoginPage(),
//     );
//   }
// }
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   String errorMessage = '';
//
//   Future<void> saveCredentials(String email, String password) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('email', email);
//     await prefs.setString('password', password);
//   }
//
//   Future<void> authenticateUser() async {
//     final email = emailController.text.trim();
//     final password = passwordController.text.trim();
//
//     if (email.isEmpty || password.isEmpty) {
//       setState(() {
//         errorMessage = 'Введите учетные данные.';
//       });
//       return;
//     }
//
//     try {
//       await saveCredentials(email, password);
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomePage()),
//       );
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Ошибка: ${e.toString()}';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Авторизация')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: 'Пароль'),
//               obscureText: true,
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: authenticateUser,
//               child: Text('Войти'),
//             ),
//             if (errorMessage.isNotEmpty)
//               Padding(
//                 padding: const EdgeInsets.only(top: 16.0),
//                 child: Text(
//                   errorMessage,
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Почтовый клиент')),
//       body: ListView(
//         children: [
//           ListTile(
//             title: Text('Отправить сообщение'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SendMessagePage()),
//               );
//             },
//           ),
//           ListTile(
//             title: Text('История сообщений'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => MessageHistoryPage()),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class SendMessagePage extends StatefulWidget {
//   @override
//   _SendMessagePageState createState() => _SendMessagePageState();
// }
//
// class _SendMessagePageState extends State<SendMessagePage> {
//   final recipientController = TextEditingController();
//   final subjectController = TextEditingController();
//   final bodyController = TextEditingController();
//   bool isLoading = false;
//   String errorMessage = '';
//
//   Future<Map<String, String>> _getCredentials() async {
//     final prefs = await SharedPreferences.getInstance();
//     final email = prefs.getString('email');
//     final password = prefs.getString('password');
//     if (email == null || password == null) {
//       throw Exception('Учетные данные не найдены.');
//     }
//     return {'email': email, 'password': password};
//   }
//
//   Future<void> sendMessage() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = '';
//     });
//
//     try {
//       final credentials = await _getCredentials();
//       final smtpServer = gmail(credentials['email']!, credentials['password']!);
//
//       final message = Message()
//         ..from = Address(credentials['email']!, 'Ваше имя')
//         ..recipients.add(recipientController.text.trim())
//         ..subject = subjectController.text.trim()
//         ..text = bodyController.text.trim();
//
//       await send(message, smtpServer);
//
//       setState(() {
//         isLoading = false;
//       });
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Сообщение отправлено!')),
//       );
//     } catch (e) {
//       setState(() {
//         print(e.toString());
//         errorMessage = 'Ошибка: ${e.toString()}';
//         isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Отправить сообщение')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: recipientController,
//               decoration: InputDecoration(labelText: 'Кому'),
//             ),
//             TextField(
//               controller: subjectController,
//               decoration: InputDecoration(labelText: 'Тема'),
//             ),
//             TextField(
//               controller: bodyController,
//               decoration: InputDecoration(labelText: 'Сообщение'),
//               maxLines: 5,
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: sendMessage,
//               child: Text('Отправить'),
//             ),
//             if (isLoading) CircularProgressIndicator(),
//             if (errorMessage.isNotEmpty)
//               Padding(
//                 padding: const EdgeInsets.only(top: 16.0),
//                 child: Text(
//                   errorMessage,
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class MessageHistoryPage extends StatefulWidget {
//   @override
//   _MessageHistoryPageState createState() => _MessageHistoryPageState();
// }
//
// class _MessageHistoryPageState extends State<MessageHistoryPage> {
//   List<String> messageHistory = [];
//
//
//   Future<void> fetchMessageHistory() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final email = prefs.getString('email');
//       final password = prefs.getString('password');
//       if (email == null || password == null) {
//         throw Exception('Учетные данные не найдены.');
//       }
//
//       // Connect to Gmail IMAP server
//       final socket = await SecureSocket.connect('imap.gmail.com', 993);
//       socket.write('a1 LOGIN $email $password\r\n');
//       socket.write('a2 SELECT INBOX\r\n');
//       socket.write('a3 FETCH 1:10 (ENVELOPE)\r\n');
//
//       // Read the server's response
//       final response = StringBuffer();
//       await socket
//           .cast<List<int>>() // Cast to correct data type
//           .transform(utf8.decoder) // Decode bytes to string
//           .listen((data) {
//         response.write(data);
//       }).asFuture();
//
//       // Parse response for email headers
//       setState(() {
//         messageHistory = response
//             .toString()
//             .split('\n')
//             .where((line) => line.contains('ENVELOPE'))
//             .toList();
//       });
//
//       socket.write('a4 LOGOUT\r\n');
//       await socket.close();
//     } catch (e) {
//       setState(() {
//         messageHistory = ['Ошибка при загрузке сообщений: ${e.toString()}'];
//       });
//     }
//   }
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     fetchMessageHistory();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('История сообщений')),
//       body: ListView.builder(
//         itemCount: messageHistory.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(messageHistory[index]),
//           );
//         },
//       ),
//     );
//   }
// }
