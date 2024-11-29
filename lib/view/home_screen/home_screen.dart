import 'package:authentication_task/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        context.read<HomeScreenController>().getProfile();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<HomeScreenController>().isLoading
          ? const Center(child: CircularProgressIndicator())
          : context.watch<HomeScreenController>().errorMessage.isNotEmpty
              ? Center(
                  child:
                      Text(context.watch<HomeScreenController>().errorMessage))
              : context.watch<HomeScreenController>().profileList == null
                  ? const Center(child: Text("No profile data available"))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.brown)
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    context
                                        .watch<HomeScreenController>()
                                        .profileList!
                                        .data!
                                        .name
                                        .toString(),
                                    style: const TextStyle(fontSize: 16,
                                    ),
                                  ),
                                  Text(context.watch<HomeScreenController>().profileList!.data!.email.toString())
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
    );
  }
}




