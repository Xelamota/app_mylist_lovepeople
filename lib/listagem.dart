import 'package:flutter/material.dart';
import 'package:my_list/add_item.dart';

class Listagem extends StatefulWidget {
  const Listagem({super.key});

  @override
  State<Listagem> createState() => _ListagemState();
}

class _ListagemState extends State<Listagem> {
  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My List'),
        centerTitle: true,
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 3,
            );
          },
          padding: const EdgeInsets.all(10),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    style: const TextStyle(fontSize: 20),
                    list[index],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var todo = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const AddItem(),
            ),
          );
          setState(() {
            if (todo != null) {
              list.add(todo);
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
