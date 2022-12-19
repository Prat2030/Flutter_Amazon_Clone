import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/constants/utils.dart';
import 'package:http/http.dart' as http;

void HttpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}){
  switch(response.statusCode){
    case 201:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['message']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBar(context, jsonDecode(response.body));
  }
}