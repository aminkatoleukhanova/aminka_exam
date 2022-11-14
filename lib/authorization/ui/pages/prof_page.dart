import 'package:amina_ex/authorization/ui/widgets/user.dart';
import 'package:flutter/material.dart';

class ProfPage extends StatefulWidget {
  const ProfPage({super.key});

  @override
  State<ProfPage> createState() => _ProfPageState();
}

class _ProfPageState extends State<ProfPage> {
  late final User userInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Info'),
        centerTitle: true,
      ),
    );
  }
}
