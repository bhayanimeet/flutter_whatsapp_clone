import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Global{
  static bool isIos = false;

  static List<Map<String,dynamic>> numberList = [
    {
      'image': 'assets/images/flag.png',
      'name' : 'Manthan Lathiya',
      'subtitle': 'What are you doing?',
      'time': 'now',
      'number': '+91 94721 61928',
    },
    {
      'image': 'assets/images/image-1.png',
      'name' : 'Jenil bhayani',
      'subtitle': 'Hey there!',
      'time': '9:20 PM',
      'number': '+91 91784 18531',
    },
    {
      'image': 'assets/images/image-2.png',
      'name' : 'jaydeep Patel',
      'subtitle': 'Well done bro',
      'time': '7:12 PM',
      'number': '+91 92643 81923',
    },
    {
      'image': 'assets/images/profile.jpg',
      'name' : 'Hardik',
      'subtitle': 'Good bye',
      'time': '4:45 PM',
      'number': '+91 93826 16422',
    },
    {
      'image': 'assets/images/virat.png',
      'name' : 'Virat Kohli',
      'subtitle': 'Hii king',
      'time': '3:09 PM',
      'number': '+91 98256 27761',
    },
    {
      'image': 'assets/images/rohit.png',
      'name' : 'Rohit Sharma',
      'subtitle': 'Hello hitman',
      'time': '12:10 PM',
      'number': '+91 97264 12961',
    },
    {
      'image': 'assets/images/dhoni.png',
      'name' : 'MS Dhoni',
      'subtitle': 'Captain cool',
      'time': '9:34 AM',
      'number': '+91 94517 89126',
    },
    {
      'image': 'assets/images/rahul.png',
      'name' : 'KL Rahul',
      'subtitle': 'Congratulations',
      'time': '8:01 AM',
      'number': '+91 96248 75130',
    },
    {
      'image': 'assets/images/profile.jpg',
      'name' : 'Didi',
      'subtitle': 'hii',
      'time': '6:01 AM',
      'number': '+91 96248 12064',
    },
  ];
  static List<Map<String,dynamic>> statusList = [
    {
      'image': 'assets/images/virat.png',
      'name' : 'Virat Kohli',
      'time': '42 minutes ago',
    },
    {
      'image': 'assets/images/image-1.png',
      'name' : 'Jenil bhayani',
      'time': 'Today, 8:12 PM',
    },
    {
      'image': 'assets/images/rahul.png',
      'name' : 'KL Rahul',
      'time': 'Today, 5:30 PM',
    },
    {
      'image': 'assets/images/image-2.png',
      'name' : 'jaydeep Patel',
      'time': 'Today, 2:12 PM',
    },
    {
      'image': 'assets/images/flag.png',
      'name' : 'Manthan Lathiya',
      'time': 'Today, 8:09 AM',
    },
  ];
  static List<Map<String,dynamic>> callList = [
    {
      'image': 'assets/images/image-1.png',
      'name' : 'Jenil bhayani',
      'time': 'January 18, 9:24 PM',
      'time2': '18/01/23',
      'number': '+91 91784 18531',
      'icon': Icons.phone,
    },
    {
      'image': 'assets/images/virat.png',
      'name' : 'Virat Kohli',
      'time': 'January 14, 3:09 PM',
      'time2': '14/01/23',
      'number': '+91 98256 27761',
      'icon': Icons.phone,
    },
    {
      'image': 'assets/images/flag.png',
      'name' : 'Manthan Lathiya',
      'time': 'January 2, 2:40 AM',
      'time2': '2/01/23',
      'number': '+91 94721 61928',
      'icon': Icons.videocam,
    },
    {
      'image': 'assets/images/dhoni.png',
      'name' : 'MS Dhoni',
      'time': 'December 18, 9:34 AM',
      'time2': '18/12/22',
      'number': '+91 94517 89126',
      'icon': Icons.phone,
    },
    {
      'image': 'assets/images/image-2.png',
      'name' : 'jaydeep Patel',
      'time': 'December 11, 7:12 PM',
      'time2': '11/12/22',
      'number': '+91 92643 81923',
      'icon': Icons.phone,
    },
  ];

  static phone({required String contact}) async{
    String number = contact;
    bool? call = await FlutterPhoneDirectCaller.callNumber(number);
  }
}