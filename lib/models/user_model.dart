class User {
  final String name;
  final String email;
  final String number;
  final String password; // New field for password
  final int age;
  final double height;
  final double weight;
  final String sex;

  User({
    required this.name,
    required this.email,
    required this.number,
    required this.password, // Include password in the constructor
    required this.age,
    required this.height,
    required this.weight,
    required this.sex,
  });

  // Define a toJson method to convert the User object to a JSON representation
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'number': number,
      'password': password, // Add password to JSON representation
      'age': age,
      'height': height,
      'weight': weight,
      'sex': sex,
    };
  }

  // Define a factory method to create a User object from JSON data
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      number: json['number'],
      password: json['password'], // Extract password from JSON data
      age: json['age'],
      height: json['height'],
      weight: json['weight'],
      sex: json['sex'],
    );
  }
}

class Exercise {
  final String name;
  final String description;
  final String imageUrl;

  Exercise(
      {required this.name, required this.description, required this.imageUrl});
}
