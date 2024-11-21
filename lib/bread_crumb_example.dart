import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class BreadCrumb {
  bool isActive;
  final String name;
  final String uuid;

  BreadCrumb({
    required this.isActive,
    required this.name,
  }) : uuid = const Uuid().v4();

  void activate() {
    isActive = true;
  }

  //For tracking the changes of items
  @override
  bool operator ==(covariant BreadCrumb other) => uuid == other.uuid;

  @override
  int get hashCode => uuid.hashCode;

  String get title => name + (isActive ? '> ' : '');
}

class BreadCrumbExample extends ChangeNotifier {
  final List<BreadCrumb> _items = [];
  UnmodifiableListView<BreadCrumb> get item => UnmodifiableListView(_items);

  void add(BreadCrumb breadCrumb) {
    if(_items.isNotEmpty){
        _items[_items.length-1].activate();
    }
  
    _items.add(breadCrumb);
    notifyListeners();
  }

  void reset() {
    _items.clear();
    notifyListeners();
  }
}

class BreadCrumbWidget extends StatelessWidget {
  final UnmodifiableListView<BreadCrumb> breadCrumbs;
  const BreadCrumbWidget({
    super.key,
    required this.breadCrumbs,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: breadCrumbs.map((breadCrumb) {
        return Text(
          breadCrumb.title,
          // This conditional rendering is for checking is any breadCrumb available after that..
          style: TextStyle(
              color: breadCrumb.isActive ? Colors.blue : Colors.black),
        );
      }).toList(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BreadCrumbExample"),
      ),
      body: Column(
        children: [
          Consumer<BreadCrumbExample>(builder: (context, value, child) {
            //sending the UnmodifiableListView od BreadCrumb type into BreadCrumbWidget to be renderd
            return BreadCrumbWidget(breadCrumbs: value.item);
          }),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/new');
              },
              child: const Text('Add new bread crumb')),
          TextButton(
              onPressed: () {
                // cleanning the list 
                context.read<BreadCrumbExample>().reset();
              },
              child: const Text('Reset')),
        ],
      ),
    );
  }
}

class AddBreadCrumb extends StatefulWidget {
  const AddBreadCrumb({super.key});

  @override
  State<AddBreadCrumb> createState() => _AddBreadCrumbState();
}

class _AddBreadCrumbState extends State<AddBreadCrumb> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration:
                  const InputDecoration(hintText: 'Enter a new bread crumb'),
            ),
            TextButton(
                onPressed: () {
                  final text = _controller.text;
                  if (text.isNotEmpty) {
                    final breadCrumb = BreadCrumb(isActive: false, name: text);
                    context.read<BreadCrumbExample>().add(breadCrumb);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text("add"))
          ],
        ),
      ),
    );
  }
}

