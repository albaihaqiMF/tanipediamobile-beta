import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tanipedia_mobile_app/data/data_source/remote/remote_services_contract.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:http/http.dart' as http;
import 'package:tanipedia_mobile_app/data/model/base/response.dart';
import 'package:tanipedia_mobile_app/core/network/api_exception.dart';
import 'package:tanipedia_mobile_app/core/network/api_headers.dart';
import 'package:tanipedia_mobile_app/core/network/api_url.dart';
import 'package:meta/meta.dart';

part 'firebase_services.dart';
part 'user/user_services.dart';
part 'profile/profile_services.dart';
part 'pupuk/pupuk_services.dart';
part 'lahan/lahan_services.dart';
part 'panen/panen_services.dart';
part 'wilayah/wilayah_services.dart';
