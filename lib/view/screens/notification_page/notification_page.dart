import 'package:flutter/material.dart';
import 'package:hookah_user/components/drawer_page.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      drawer: drawer(context),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 14,
              );
            },
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: ListTile(
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.network(
                      'https://m.media-amazon.com/images/I/41XzX9DYQWL.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: const Text('Lorem Ipsum'),
                  subtitle: const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing... '),
                  trailing: const Text('1m ago'),
                ),
              );
            }),
      ),
    );
  }
}
