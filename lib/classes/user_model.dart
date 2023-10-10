import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String? id;
  final String fullName;
  final int phone;
  final String address;
  final String email;
  final String password;
  final String role;
  final String created_at;
  final String updated_at;
  final bool active;

  const UserModel({
    this.id, 
    required this.fullName,
    required this.phone,
    required this.address,
    required this.email,
    required this.password,
    required this.role,
    required this.created_at,
    required this.updated_at,
    required this.active,
  });
  

  toJson(){
    return{
      "FullName" : fullName,
      "Phone" : phone,
      "Address" : address,
      "Email": email,
      "Password": password,
      "Role" : role,
      "Created_At" : created_at,
      "Updated_At" : updated_at,
      "Active" : active,
    };
  }

  //Map user fetched data from Firebase to UserModel
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return UserModel(
      id: document.id, 
      fullName: data["FullName"], 
      phone: data["Phone"], 
      address: data["Address"], 
      email: data["Email"], 
      password: data["Password"], 
      role: data["Role"], 
      created_at: data["Created_At"], 
      updated_at: data["Updated At"], 
      active: data["Active"],
      );
  }
}