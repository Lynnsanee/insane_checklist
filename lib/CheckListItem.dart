class CheckListItem {
  int id;
  String title;
  String description;
  String groupTopic;
  DateTime timeAdd;
  DateTime dueDate;
  bool finished = false;
  int priority;

  CheckListItem(this.id, this.title, this.description, this.groupTopic,
      this.timeAdd, this.dueDate, this.finished, this.priority);
}
