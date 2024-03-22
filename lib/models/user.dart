class User {
  User({required this.username, required this.password});

  final String username;
  final String password;
}

List<User> users = [
  User(username: 'aju', password: 'aju'),
  User(username: 'rahul', password: 'password')
];
