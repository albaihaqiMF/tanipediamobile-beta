import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:http/http.dart' as http;
import 'package:tanipedia_mobile_app/model/base/response.dart';
import 'package:tanipedia_mobile_app/network/api_exception.dart';
import 'package:tanipedia_mobile_app/network/api_headers.dart';
import 'package:tanipedia_mobile_app/network/api_url.dart';

part 'firebase_services.dart';
part 'user_services.dart';
part 'profile_services.dart';
part 'pupuk_services.dart';
part 'lahan_services.dart';
part 'panen_services.dart';
part 'wilayah_services.dart';
