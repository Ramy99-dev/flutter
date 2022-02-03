class Todo {
  final String todo;

  const Todo({required this.todo});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(todo: json['todo']);
  }
}
