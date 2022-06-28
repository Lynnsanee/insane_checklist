import 'package:flutter/material.dart';
import 'package:insane_checklist/CheckList.dart';
import 'package:insane_checklist/CheckListItem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _mainScreen();
}

class _mainScreen extends State<MyApp> {
  List<CheckListItem> myItems = [
    CheckListItem(0, "Buy apple", "Buy a nice apple", "Groceries",
        DateTime(2022, 6, 28), DateTime(2022, 6, 28), false, 2),
    CheckListItem(1, "Buy pear", "Buy a nice pear", "Groceries",
        DateTime(2022, 6, 28), DateTime(2022, 6, 29), false, 2),
    CheckListItem(2, "Buy banana", "Buy a nice banana", "Groceries",
        DateTime(2022, 6, 28), DateTime(2022, 6, 30), false, 2)
  ];

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Checklist myChecklist = Checklist(
        1,
        "Example checklist",
        "This checklist is an example",
        "Other",
        DateTime(2022, 25),
        (DateTime(2022, 6, 31)),
        true,
        1,
        myItems);

    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: Center(
          child: SizedBox(
              height: 300,
              width: double.infinity,
              child: ListView(children: itemsToWidgets(myChecklist.items))),
        ),
      ),
    );
  }

  List<Padding> itemsToWidgets(List<CheckListItem> items) {
    List<Padding> widgetList = [];
    for (CheckListItem item in items) {
      widgetList.add(
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: Checkbox(
                  value: item.finished,
                  onChanged: (bool? newValue) {
                    item.finished = newValue!;
                    refresh();
                  },
                ),
              ),
              Expanded(
                flex: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Text(
                      item.groupTopic,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Icon(Icons.calendar_today_outlined),
                    ),
                    Expanded(
                      child: Text(
                        dateRelatesToCurrentTimeAs(item.dueDate),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      );
    }

    return widgetList;
  }

  String dateRelatesToCurrentTimeAs(DateTime compareDate) {
    // get current time and compare it to compareDate
    String dateRepresentation =
        "${compareDate.year}-${compareDate.month}-${compareDate.day}";
    DateTime now = DateTime.now();
    if (now.year == compareDate.year &&
        now.month == compareDate.month &&
        now.day == compareDate.day) {
      dateRepresentation = "Today";
    } else if (now.year == compareDate.year &&
        now.month == compareDate.month &&
        now.day + 1 == compareDate.day) {
      dateRepresentation = "Tomorrow";
    }

    return dateRepresentation;
  }
}
