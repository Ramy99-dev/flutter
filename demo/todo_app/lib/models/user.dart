class User {
  final String email;
  final String password;

  const User({required this.email, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(email: json['email'], password: json['password']);
  }
}
