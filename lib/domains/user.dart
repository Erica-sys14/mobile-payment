class User {
  String firstname;
  String lastname;
  String email;
  String phone;
  String curr_org_id;
  String api_key;


  User({required this.firstname, required this.lastname, required this.email, required this.phone, required this.curr_org_id, required this.api_key});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      firstname: responseData['firstname'],
      lastname: responseData['lastname'],
      email: responseData['email'],
      phone: responseData['phone'],
      curr_org_id: responseData['curr_org_id'],
      api_key: responseData['api_key'],
    );
  }
}