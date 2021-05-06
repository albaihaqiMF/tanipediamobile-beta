import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanipedia_mobile_app/core/error/failures.dart';
import 'package:tanipedia_mobile_app/core/local_storage/sharedpreference/key_shared_preference.dart';
import 'package:tanipedia_mobile_app/core/local_storage/database/dao/dao.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:tanipedia_mobile_app/injection_container.dart';

part 'profile_local_services.dart';