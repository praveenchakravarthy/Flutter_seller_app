import 'package:get_storage/get_storage.dart';
import 'dart:convert';

class UserData {
  final box = GetStorage();

  getUserId() async {
    var userData = await json.decode(box.read('user'));
    return userData['id'];
  }
  getUserRole() async {
    var userData = await json.decode(box.read('user'));
    return userData['role'];
  }

  getUserName() async {
    var userData = await json.decode(box.read('user'));
    return userData['name'];
  }

  getUserToken() async {
    var userData = await json.decode(box.read('user'));
    return userData['token'];
  }
  getUserMobile() async {
    var userData = await json.decode(box.read('user'));
    return userData['mobileNo'];
  }

  getUserReSellerId() async {
    var userData = await json.decode(box.read('user'));
    return userData['reSellerId'];
  }

  getUserClientId() async {
    var userData = await json.decode(box.read('user'));
    return userData['clientId'];
  }

  isLoggedIn() {
    return box.hasData('user');
  }
}