import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GuestLoginPage extends StatelessWidget {
  const GuestLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: const Text("Back"),
      ),
      body: Center(
        child: Text('Guest Login Page'),
      ),
    );
  }
}
