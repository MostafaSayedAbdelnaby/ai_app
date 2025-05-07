import 'package:flutter/material.dart';

import 'home_tab.dart';

class ClickOn extends StatefulWidget {
  const ClickOn({super.key});

  @override
  State<ClickOn> createState() => _ClickOnState();
}

class _ClickOnState extends State<ClickOn> {
  late Future<Stream> futureStream;

  @override
  void initState() {
    super.initState();
    futureStream = stream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Stream>(
        future: futureStream,
        builder: (context, futureSnapshot) {
          if (futureSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (futureSnapshot.hasError) {
            return Text('Error: ${futureSnapshot.error}');
          } else if (!futureSnapshot.hasData) {
            return const Text("No stream available");
          }
          return StreamBuilder<dynamic>(
            stream: futureSnapshot.data!,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData) {
                return const Text("No data yet...");
              } else {
                return Center(
                  child: Text(
                    snapshot.data.toString(),
                    style: const TextStyle(fontSize: 24),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
