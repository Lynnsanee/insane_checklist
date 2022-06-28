import 'package:insane_checklist/CheckListItem.dart';
import 'package:flutter/material.dart';

class Checklist {
  int id;
  String title;
  String description;
  String groupTopic;
  DateTime timeAdd;
  DateTime dueDate;
  bool active = true;
  int priority;
  List<CheckListItem> items;

  Checklist(this.id, this.title, this.description, this.groupTopic,
      this.timeAdd, this.dueDate, this.active, this.priority, this.items);
}
